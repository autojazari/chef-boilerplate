# Cookbook Name:: stig
# Recipe:: login_defs
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Update account expiration definitions
#
# CIS Benchmark Items
# RHEL6: 7.2.1, 7.2.2, 7.2.3
# CENTOS6: 7.1.1, 7.1.2, 7.1.3
# UBUNTU: 10.1.1, 10.1.2, 10.1.3
#
# - Set Password Expiration Days
# - Set Password Change Minimum Number of Days
# - Set Password Expiring Warning Days

template '/etc/login.defs' do
  source 'etc_login.defs.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    pass_max_days: node['stig']['login_defs']['pass_max_days'],
    pass_min_days: node['stig']['login_defs']['pass_min_days'],
    pass_warn_age: node['stig']['login_defs']['pass_warn_age']
  )
end
