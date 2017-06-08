# Cookbook Name:: stig
# Recipe:: system_auth
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Configure Sysauth and password-auth
# TODO: Re-add cracklib.so settings for CentOS 6.x

require 'pathname'

platform = node['platform']

pass_reuse_limit = node['stig']['system_auth']['pass_reuse_limit']
pamd_dir = '/etc/pam.d'

# We assume that the system-auth and password-auth files are symlinks. I want to
# check the full path that they're symlinked to and use that path in this recipe
# Previously, I was hard-coding the real file at /etc/pam.d/system-auth-ac and
# /etc/pam.d/password-auth-ac but because other installations like Centrify took
# those files and created a file structure that looks like:
#
# lrwxrwxrwx.  1 root root   29 Mar  8 18:59 system-auth -> /etc/pam.d/system-auth-ac.cdc
# -rw-r--r--.  1 root root 1262 Mar  8 18:59 system-auth-ac.cdc
# -rw-------.  1 root root  905 Mar  8 18:59 system-auth-ac.pre_cdc
#
# This recipe would end up blowing away system-auth and creating havoc on the system
# If these happen to not be symlinks, there is a guard that stops this recipe from
# needlessly creating a symlink
system_auth_symlink = "#{pamd_dir}/system-auth"
system_auth_file = File.symlink?(system_auth_symlink) ? Pathname.new(system_auth_symlink).realpath.to_s : system_auth_symlink

password_auth_symlink = "#{pamd_dir}/password-auth"
password_auth_file = File.symlink?(system_auth_symlink) ? Pathname.new(password_auth_symlink).realpath.to_s : password_auth_symlink

template system_auth_file do
  source 'etc_pam_d_password_system_auth.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    auth_rules: node['stig']['pam_d']['config']['system_auth']
  )
end

template password_auth_file do
  source 'etc_pam_d_password_system_auth.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    auth_rules: node['stig']['pam_d']['config']['password_auth']
  )
end

link system_auth_symlink do
  to system_auth_file
  only_if { File.symlink?(system_auth_symlink) && system_auth_symlink != system_auth_file }
end

link password_auth_symlink do
  to password_auth_file
  only_if { File.symlink?(password_auth_symlink) && password_auth_symlink != password_auth_file }
end

template '/etc/pam.d/common-password' do
  source 'etc_pam.d_common-password.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    pass_reuse_limit: pass_reuse_limit
  )
  only_if { %w(debian ubuntu).include? platform }
end

template '/etc/security/pwquality.conf' do
  source 'etc_security_pwquality.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    pass_reuse_limit: pass_reuse_limit
  )
  only_if { %w(amazon).include? platform }
end

node['etc']['passwd'].each do |user, data|
  execute 'set_password_inactivity_#{user}' do
    command "chage --inactive 30 #{user}"
    only_if { %w(amazon).include? platform }
  end
end