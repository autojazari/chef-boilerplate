# Cookbook Name:: stig
# Recipe:: dhcp
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Remove DHCP Server
#
# CIS Benchmark Items
# RHEL6:  3.5
# CENTOS6: 3.5
# UBUNTU: 6.4

platform = node['platform']
major_version = node['platform_version'][0, 1].to_i

package 'dhcp' do
  action :remove
  provider Chef::Provider::Package::Rpm
  only_if { %w(rhel fedora centos redhat).include? platform }
end

# Probably no need to run this due to above but why not make sure
execute 'Disable dhcpd via sysctl' do
  user 'root'
  command '/usr/bin/systemctl disable dhcpd'
  action :run
  only_if "systemctl >/dev/null 2>&1 && /usr/bin/systemctl list-unit-files | grep -q 'dhcpd'"
  not_if "systemctl >/dev/null 2>&1 && /usr/bin/systemctl is-enabled dhcpd | grep -q 'disabled'"
  only_if { %w(rhel fedora centos redhat amazon).include? platform }
  only_if { major_version >= 7 }
end

template '/etc/init/isc-dhcp-server.conf' do
  source 'etc_init_isc-dhcp-server.conf.erb'
  owner 'root'
  group 'root'
  only_if { %w(debian ubuntu).include? platform }
end

template '/etc/init/isc-dhcp-server6.conf' do
  source 'etc_init_isc-dhcp-server6.conf.erb'
  owner 'root'
  group 'root'
  only_if { %w(debian ubuntu).include? platform }
end
