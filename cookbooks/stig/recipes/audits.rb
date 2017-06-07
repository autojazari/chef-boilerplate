# Cookbook Name:: stig
# Recipe:: audits
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description:
#
# CIS Benchmark Items
# RHEL6: 9.1.9, 9.1.0, 9.1.11, 9.2.1, 9.2.2, 9.2.3, 9.2.4, 9.2.5
# CENTOS6: 9.1.10, 9.1.11, 9.1.12, 9.2.1, 9.2.2, 9.2.3, 9.2.4, 9.2.5
# UBUNTU: 12.7, 12.8, 12.9, 13.1, 13.2, 13.3, 13.4, 13.5
# - Fix World Writable Files
# - Fix Un-owned Files and Directories
# - Fix Un-grouped Files and Directories
# - Ensure Password Fields are Not Empty
# - Verify No Legacy "+" Entries Exist in /etc/passwd File
# - Verify No Legacy "+" Entries Exist in /etc/shadow File
# - Verify No Legacy "+" Entries Exist in /etc/group File
# - Verify No UID 0 Accounts Exist Other Than root

bash 'remove_world_writable_flag_from_files' do
  user 'root'
  code "for fn in $(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002);do chmod o-w $fn;done"
  only_if "test -n \"$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002)\"", user: 'root'
end

bash 'reclaim_ownership_of_orphaned_files_and_dirs' do
  user 'root'
  code "for fn in $(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser -ls | awk '{ printf $11\"\\n\" }'); do chown root:root $fn;done"
  only_if "test -n \"$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser -ls)\"", user: 'root'
end

bash 'find group orphaned files and directories' do
  user 'root'
  code "for fn in $(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls | awk '{ printf $11\"\\n\" }'); do chown root:root $fn;done"
  only_if "test -n \"$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls)\"", user: 'root'
end

bash 'no_empty_passwd_fields' do
  user 'root'
  code "for user in $(/bin/cat /etc/shadow | /bin/awk -F: '($2 == \"\")' | cut -d':' -f1 $1);do /usr/bin/passwd -l $user;done"
  only_if "test -n \"$(/bin/cat /etc/shadow | /bin/awk -F: '($2 == \"\" )')\"", user: 'root'
end

bash 'no legacy + entries exist in /etc/passwd' do
  user 'root'
  code "sed -i '/^+/ d' /etc/passwd"
  only_if "test -n \"$(/bin/grep '^+' /etc/passwd)\"", user: 'root'
end

bash 'no legacy + entries exist in /etc/shadow' do
  user 'root'
  code "sed -i '/^+/ d' /etc/shadow"
  only_if "test -n \"$(/bin/grep '^+' /etc/shadow)\"", user: 'root'
end

bash 'no legacy + entries exist in /etc/group' do
  user 'root'
  code "sed -i '/^+/ d' /etc/group"
  only_if "test -n \"$(/bin/grep '^+' /etc/group)\"", user: 'root'
end

bash 'no UID 0 except root account exists' do
  user 'root'
  code "for acct in $(/bin/cat /etc/passwd | /bin/awk -F: '($3 == 0) { print $1 }' | grep -v \"root\"); do sed -i \"/^$acct:/ d\" /etc/passwd;done"
  only_if "/bin/cat /etc/passwd | /bin/awk -F: '($3 == 0) { print $1 }' | grep -v \"root\"", user: 'root'
end
