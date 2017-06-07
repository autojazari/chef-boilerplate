#
# Cookbook Name:: stig
# Recipe:: su_restriction
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# CENTOS6: 6.5
#
# Description: Restrict access to the su command

cookbook_file '/etc/pam.d/su for RHEL' do
  path '/etc/pam.d/su'
  source 'etc_pam_d_su_centos'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(rhel fedora centos rhel x86_64-linux).include? node['platform'] }
end

cookbook_file '/etc/pam.d/su for Debian' do
  path '/etc/pam.d/su'
  source 'etc_pam_d_su_ubuntu'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(debian ubuntu).include? node['platform'] }
end
