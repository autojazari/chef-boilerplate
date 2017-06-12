# Cookbook Name:: stig
# Recipe:: boot_settings
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Configure boot settings
#
# CIS Benchmark Items

# RHEL6:  1.5.2, 1.5.3, 1.5.4, 1.5.5, 1.5.6, 1.6.1, 1.6.2, 1.6.3, 1.6.4, 4.2.1, 4.2.2, 4.2.3
# CENTOS6: 1.4.1, 1.4.2, 1.4.3, 1.4.4, 1.4.5, 1.4.6, 1.5.1, 1.5.2, 1.5.3, 1.5.5, 5.2.1, 5.2.2, 5.2.3
# UBUNTU: 3.1, 3.2,
# - Enable SELinux in /etc/grub.conf.
# - Set SELinux state
# - Set SELinux policy
# - Remove SETroubleshoot
# - Remove MCS Translation Service
# - Check for unconfined daemons - NOTE: This doesn't have an action plan associated with it
# - Set User/Group Owner on /etc/grub.conf
# - Set Permissions on /etc/grub.conf
# - Set Boot Loader Password
# - Require Authentication for Single-User Mode.
# - Disable Interactive Boot.
# - Disable Source Routed Packet Acceptance
# - Disable ICMP Redirect Acceptance
# - Disable Secure ICMP Redirect Acceptance

platform = node['platform']

# Get major version for RHEL distro
major_version = node['platform_version'][0, 1].to_i

template '/etc/grub.d/40_custom' do
  source 'etc_grubd_40_custom.erb'
  variables(
    pass: node['stig']['grub']['hashedpassword']
  )
  sensitive true
  notifies :run, 'execute[update-grub]', :immediately
  only_if { %w(debian ubuntu).include? platform }
end

execute 'update-grub' do
  action :nothing
  only_if { %w(debian ubuntu).include? platform }
end

grub_file = %w(rhel fedora centos redhat amazon).include?(platform) && major_version < 7 ? '/boot/grub/grub.conf' : '/boot/grub2/grub.cfg'

# This is not scored (or even suggested by CIS) in Ubuntu
file grub_file do
  owner 'root'
  group 'root'
  mode '0o600'
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

# 1.4.1
execute 'Remove selinux=0 from grub file' do
  command "sed -i 's/selinux=0//' #{grub_file}"
  only_if "grep -q 'selinux=0' #{grub_file}"
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

execute 'Remove enforcing=0 from grub file' do
  command "sed -i 's/enforcing=0//' #{grub_file}"
  only_if "grep -q 'enforcing=0' #{grub_file}"
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

# 1.5.3
password = node['stig']['grub']['hashedpassword']
execute 'Add MD5 password to grub' do
  command "sed -i '11i password --md5 #{password}' #{grub_file}"
  not_if "grep -q '#{password}' #{grub_file}"
  only_if { %w(rhel fedora centos redhat amazon ubuntu).include? platform }
  only_if { node['stig']['grub']['hashedpassword'] != '' }
end

execute 'Add password to grub' do
  command "sed -i '/password/d' #{grub_file}"
  only_if "grep -q 'password' #{grub_file}"
  only_if { %w(rhel fedora centos redhat amazon ubuntu).include? platform }
  only_if { node['stig']['grub']['hashedpassword'] == '' }
end

# TODO: Create adding password to grub for CentOS 7
# Programtically using grub2-mkpasswd-pbkdf2: echo -e 'mypass\nmypass' | grub2-mkpasswd-pbkdf2 | awk '/grub.pbkdf/{print$NF}'

cookbook_file '/etc/inittab' do
  source 'etc_inittab'
  only_if { %w(rhel fedora centos redhat amazon ubuntu).include? platform }
end

enabled_selinux = node['stig']['selinux']['enabled']
status_selinux = node['stig']['selinux']['status']
type_selinux = node['stig']['selinux']['type']

template '/etc/selinux/config' do
  source 'etc_selinux_config.erb'
  owner 'root'
  group 'root'
  variables(enabled_selinux: enabled_selinux,
            status_selinux: status_selinux,
            type_selinux: type_selinux)
  mode 0o644
  sensitive true
  notifies :run, 'execute[toggle_selinux]', :delayed
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

link '/etc/sysconfig/selinux' do
  to '/etc/selinux/config'
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

template '/selinux/enforce' do
  source 'selinux_enforce.erb'
  owner 'root'
  group 'root'
  variables(enforcing: (enabled_selinux ? 1 : 0))
  only_if { ::File.directory?('/selinux') }
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
  mode 0o644
end

# Do not run this if selinux is already in the state we expect or if disabled.
# If disabled, running setenforce fails so do not run setenforce if selinux is disabled
execute 'toggle_selinux' do
  command "setenforce #{(enabled_selinux ? 1 : 0)}"
  not_if "echo $(getenforce) | awk '{print tolower($0)}' | grep -q -E '(#{status_selinux}|disabled)'"
  ignore_failure true
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
end

# TODO: Ensure authentication required for single user mode for CentOS 7
template '/etc/sysconfig/init' do
  source 'etc_sysconfig_init.erb'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
  only_if { major_version < 7 }
end

package 'setroubleshoot' do
  action :remove
end

package 'mcstrans' do
  action :remove
end

source = ''
if %w(rhel fedora centos amazon).include?(node['platform'])
  source = 'etc_default_grub_rhel.erb'
end

if %w(debian ubuntu).include?(node['platform'])
  source = 'etc_default_grub_ubuntu.erb'
end

template '/etc/default/grub' do
  source source
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(ubuntu).include? platform }
  notifies :run, 'execute[update-grub]', :immediately
end