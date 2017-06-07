#
# Cookbook Name:: stig
# Recipe:: ipv6
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Disable IPv6
#
# CIS Benchmark Items
# RHEL6:  4.4.1
# CENTOS6: 5.4
#
# - Disable IPv6 for RHEL

if node['stig']['network']['ipv6'] == 'no'
  ipv6 = 1
  ipv6onoff = 'off'
else
  ipv6 = 0
  ipv6onoff = 'on'
end

if %w(rhel fedora centos redhat x86_64-linux).include?(node['platform'])
  # Install IPTables, turn off Firewalld
  if node['platform_version'][0, 1].to_i >= 7

    package 'iptables-services'

    execute 'enable_iptables' do
      command 'systemctl enable iptables'
      user 'root'
      not_if 'systemctl list-unit-files iptables.service | grep -q -w enabled'
    end

    execute 'enable_ip6tables' do
      command 'systemctl enable ip6tables'
      user 'root'
      not_if 'systemctl list-unit-files ip6tables.service | grep -q -w enabled'
    end

    execute 'start_iptables' do
      command 'systemctl start iptables'
      user 'root'
      not_if 'systemctl is-active iptables.service | grep -q -w active'
    end

    execute 'start_ip6tables' do
      command 'systemctl start ip6tables'
      user 'root'
      not_if 'systemctl is-active ip6tables.service | grep -q -w active'
      not_if { node['stig']['network']['ipv6'] == 'no' }
    end
  else
    execute 'chkconfig_ip6tables_off' do
      user 'root'
      command "/sbin/chkconfig ip6tables #{ipv6onoff}"
      not_if "chkconfig --list ip6tables  | grep -q '2:#{ipv6onoff}'"
      not_if "chkconfig --list ip6tables  | grep -q '3:#{ipv6onoff}'"
      not_if "chkconfig --list ip6tables  | grep -q '4:#{ipv6onoff}'"
      not_if "chkconfig --list ip6tables  | grep -q '5:#{ipv6onoff}'"
    end
  end

  template '/etc/sysconfig/network' do
    source 'etc_sysconfig_network.erb'
    user 'root'
    group 'root'
    mode 0o644
  end

  template '/etc/modprobe.d/ipv6.conf' do
    source 'etc_modprobe.d_ipv6.conf.erb'
    user 'root'
    group 'root'
    mode 0o644
    variables(ipv6: ipv6)
  end
end
