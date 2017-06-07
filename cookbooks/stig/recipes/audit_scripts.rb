# Cookbook Name:: stig
# Recipe:: audit_scripts
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Adds scripts that perform auditing at the user and group level
#
# CIS Benchmark Items
# RHEL6: 9.1.12, 9.1.13, 9.2.6, 9.2.10, 9.2.11, 9.2.12, 9.2.15, 9.2.16, 9.2.18, 9.2.19
# CENTOS6: 9.1.13, 9.1.14, 9.2.6, 9.2.10, 9.2.11, 9.2.12, 9.2.14, 9.2.15, 9.2.16, 9.2.17
# UBUNTU: 12.10, 12.11, 13.6, 13.10, 13.11, 13.12, 13.14, 13.15, 13.16, 13.17
# - Find SUID System Executables
# - Find SGID System Executables
# - Ensure root PATH Integrity
# - Check for Presence of User .rhosts Files
# - Check Groups in /etc/passwd
# - Check That Users Are Assigned Valid Home Directories
# - Check for Duplicate UIDs
# - Check for Duplicate GIDs
# - Check for Duplicate User Names
# - Check for Duplicate Group Names

# NOTE: UBUNTU CIS item 13.12 does show the user "nobody". This user should not have a home directory and this is a false positive produced by this script. The "nobody" account is expected on Unix systems. https://wiki.ubuntu.com/nobody
# The script  /root/.audit/validate_users_homedirs.sh should be updated to ignore the "nobody" user

# Generate audit directory in /root
directory '/root/.audit' do
  owner 'root'
  group 'root'
  mode 0o600
end

cookbook_file 'find_suid_system_executables.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/find_suid_system_executables.sh'
  mode 0o700
end

cookbook_file 'find_sgid_system_executables.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/find_sgid_system_executables.sh'
  mode 0o700
end

cookbook_file 'path_integrity_check.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/path_integrity_check.sh'
  mode 0o700
end

cookbook_file 'rhosts_check.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/rhosts_check.sh'
  mode 0o700
end

cookbook_file 'check_groups_in_etc_passwd.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/check_groups_in_etc_passwd.sh'
  mode 0o700
end

cookbook_file 'validate_users_homedirs.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/validate_users_homedirs.sh'
  mode 0o700
end

cookbook_file 'check_duplicate_uid.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/check_duplicate_uid.sh'
  mode 0o700
end

cookbook_file 'check_duplicate_gid.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/check_duplicate_gid.sh'
  mode 0o700
end

cookbook_file 'check_duplicate_usernames.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/check_duplicate_usernames.sh'
  mode 0o700
end

cookbook_file 'check_duplicate_groupnames.sh' do
  user 'root'
  group 'root'
  path '/root/.audit/check_duplicate_groupnames.sh'
  mode 0o700
end
