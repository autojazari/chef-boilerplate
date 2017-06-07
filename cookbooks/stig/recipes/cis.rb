# Cookbook Name:: stig
# Recipe:: cis
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: File system configuration
#
# CIS Benchmark Items
# RHEL6:  1.1.18, 1.1.19, 1.1.20, 1.1.21, 1.1.22, 1.1.23, 1.1.24, 4.8.1, 4.8.2, 4.8.3, 4.8.4
# CENTOS6: 1.1.18, 1.1.19, 1.1.20, 1.1.21, 1.1.22, 1.1.23, 1.1.24, 5.6.1, 5.6.2, 5.6.3, 5.6.4
# UBUNTU: 2.1.8, 2.1.9, 2.20, 2.21, 2.22, 2.23, 2.24, 7.5.1, 7.5.2, 7.5.3, 7.5.4

# - Disable Mounting of cramfs Filesystems
# - Disable Mounting of freevxfs Filesystems
# - Disable Mounting of jffs2 Filesystems
# - Disable Mounting of hfs Filesystems
# - Disable Mounting of hfsplus Filesystems
# - Disable Mounting of squashfs Filesystems
# - Disable Mounting of udf Filesystems
# - Disable Mounting of vfat Filesystems
# - Disable DCCP
# - Disable SCTP
# - Disable RDS
# - Disable TIPC
# - Disable IPV6

template '/etc/modprobe.d/CIS.conf' do
  source 'etc_modprobe.d_CIS.conf.erb'
  owner 'root'
  group 'root'
  mode 0o644
end
