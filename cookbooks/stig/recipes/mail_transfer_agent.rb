# Cookbook Name:: stig
# Recipe:: mail_transfer_agent
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Configure Mail Transfer Agent for Local-Only Mode
#
# CIS Benchmark Items
# RHEL6:  3.1.16
# CENTOS6: 3.16
# Ubuntu 6.15

source = ''
if %w(rhel fedora centos amazon).include?(node['platform'])
  source = 'etc_main.cf_rhel.erb'
end

if %w(debian ubuntu).include?(node['platform'])
  source = 'etc_main.cf_ubuntu.erb'
end

template '/etc/postfix/main.cf' do
  source source
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(ubuntu).include? platform }
  notifies :restart, 'service[postfix]', :immediately
end

service 'postfix' do
  action :nothing
end
