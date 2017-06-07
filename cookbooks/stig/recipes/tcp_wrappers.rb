#
# Cookbook Name:: stig
# Recipe:: tcp_wrappers
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Install TCP Wrappers

package 'tcp_wrappers' if %w(rhel fedora centos redhat amazon).include?(node['platform'])

package 'tcpd' if %w(debian ubuntu).include?(node['platform'])
