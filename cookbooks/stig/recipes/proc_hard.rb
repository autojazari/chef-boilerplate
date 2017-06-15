# Cookbook Name:: stig
# Recipe:: proc_hard
# Author: David Blodgett <dblodgett@usgs.gov>, Ivan Suftin <isuftin@usgs.gov>
#
# Description: Updates sysctl policies using the third-party sysctl cookbook
# and parameters specific to that cookbook coming from the default attributes.

template '/etc/security/limits.conf' do
  source 'limits.conf.erb'
  owner 'root'
  group 'root'
  mode 0o644
end

package 'apport' do
  action :remove
  only_if { %w(debian ubuntu).include? node['platform'] }
end

package 'whoopsie' do
  action :remove
  only_if { %w(debian ubuntu).include? node['platform'] }
end

include_recipe 'sysctl::apply'

template '/etc/sysctl.conf' do
  source 'etc_sysctl.conf_rhel.erb'
  mode '0644'
  only_if { %w(amazon).include? node['platform'] }
end