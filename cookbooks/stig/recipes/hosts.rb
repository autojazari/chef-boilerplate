# Cookbook Name:: stig
# Recipe:: hosts
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Update /etc/hosts.* files
#
# CIS Benchmark Items
# RHEL6:  4.5.1, 4.5.2, 4.5.3, 4.5.4
# CENTOS6: 5.5.2, 5.5.3, 5.5.4, 5.5.5
# UBUNTU: 7.4.2, 7.4.3, 7.4.4, 7.4.5
#
# - Create /etc/hosts.allow
# - Verify Permissions on /etc/hosts.allow
# - Create /etc/hosts.deny
# - Verify Permissions on /etc/hosts.deny

template '/etc/hosts.allow' do
  owner 'root'
  group 'root'
  mode 0o644
  source 'etc_hosts.allow.erb'
  variables(
    hosts_allow: node['stig']['network']['hosts_allow']
  )
end

template '/etc/hosts.deny' do
  owner 'root'
  group 'root'
  mode 0o644
  source 'etc_hosts.deny.erb'
  variables(
    hosts_deny: node['stig']['network']['hosts_deny']
  )
end
