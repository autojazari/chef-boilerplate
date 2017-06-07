# Cookbook Name:: stig
# Recipe:: auditd_rules
# Author: Ivan Suftin <isuftin@usgs.gov>
# Description: Add this recipe in your cookbook and pass in
# attributes for rule sets or use the defaults below

template '/etc/audit/audit.rules' do
  source 'audit_rules.erb'
  mode '0640'
  owner 'root'
  group 'root'
  variables(buffer: node['stig']['auditd']['buffer'],
            failure_mode: node['stig']['auditd']['failure_mode'],
            rules: node['stig']['auditd']['rules'])
  notifies :reload, 'service[auditd]', :immediately
end
