#
# Cookbook Name:: stig
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

# RHEL6: 1.1.2, 1.1.3, 1.1.4, 1.1.6, 1.14, 1.1.15, 1.1.16

# CENTOS6: 1.1.2, 1.1.3, 1.1.4, 1.1.6, 1.1.14, 1.1.15, 1.1.16
# CENTOS7: 1.1.2, 1.1.3, 1.1.4, 1.1.6, 1.1.14, 1.1.15, 1.1.16
# UBUNTU: 2.2, 2.3, 2.4, 2.6, 2.14, 2.15, 2.16
include_recipe 'stig::fstab_tmp'

# RHEL6: 1.4.1, 1.4.2
# CENTOS6: 1.3.1, 1.3.2
# UBUNTU: 8.3.1, 8.3.2
include_recipe 'stig::aide'

# Ubuntu 7.4.1
# CentOS 5.5.1
# Redhat 4.5
include_recipe 'stig::tcp_wrappers'

# RHEL6:  1.5.1, 1.5.2, 1.5.3, 1.5.4, 1.5.5, 1.5.6, 1.6.1, 1.6.2, 1.6.3, 1.6.4, 4.2.1, 4.2.2, 4.2.3
# CENTOS6: 1.4.1, 1.4.2, 1.4.3, 1.4.4, 1.4.5, 1.4.6, 1.5.1, 1.5.2, 1.5.3, 1.5.5, 5.2.1, 5.2.2, 5.2.3
# UBUNTU: 3.1, 3.2,
include_recipe 'stig::boot_settings'

# RHEL6:  1.7.1, 1.7.2, 1.7.3, 4.1.1, 4.1.2, 4.2.2, 4.2.3, 4.2.4, 4.2.7, 4.4.2.2
# CENTOS6: 1.6.1, 1.6.2, 1.6.3, 5.1.1, 5.1.2, 5.2.2, 5.2.3, 5.2.4, 5.2.7, 5.4.1.1, 5.4.1.2
# UBUNTU: 4.1, 4.3, 7.1.1, 7.1.2, 7.2.2, 7.2.3, 7.2.4, 7.2.7, 7.3.1, 7.3.2, 7.3.3
include_recipe 'stig::proc_hard'

# RHEL6:  1.1.18, 1.1.19, 1.1.20, 1.1.21, 1.1.22, 1.1.23, 1.1.24, 4.8.1, 4.8.2, 4.8.3, 4.8.4
# CENTOS6: 1.1.18, 1.1.19, 1.1.20, 1.1.21, 1.1.22, 1.1.23, 1.1.24, 5.6.1, 5.6.2, 5.6.3, 5.6.4
# UBUNTU: 2.1.8, 2.1.9, 2.20, 2.21, 2.22, 2.23, 2.24, 7.5.1, 7.5.2, 7.5.3, 7.5.4
include_recipe 'stig::cis'

# RHEL6:  3.3
# CENTOS6: 3.3
# UBUNTU: 6.2
include_recipe 'stig::avahi_daemon'

# RHEL6:  4.4.1
# CENTOS6: 5.4
include_recipe 'stig::ipv6'

# RHEL6:  3.5
# CENTOS6: 3.5
# UBUNTU: 6.4
include_recipe 'stig::dhcp'

# RHEL6:  3.1.16
# CENTOS6: 3.16
# Ubuntu 6.15
include_recipe 'stig::mail_transfer_agent'

# RHEL6:  4.5.1, 4.5.2, 4.5.3, 4.5.4
# CENTOS6: 5.5.2, 5.5.3, 5.5.4, 5.5.5
# UBUNTU: 7.4.2, 7.4.3, 7.4.4, 7.4.5
include_recipe 'stig::hosts'

# RHEL6:  5.1.3
# CENTOS6: 4.1.3
# UBUNTU: 8.2.3
include_recipe 'stig::rsyslog'

# RHEL6:  5.3
# CENTOS6: 4.3
# UBUNTU: 8.4
# TODO- CIS makes no specific recommendations for Ubuntu. The CentOS recommendations may or may not be correct
include_recipe 'logrotate::global'

# RHEL6: 6.2.2, 6.2.3, 6.2.5, 6.2.6, 6.2.7, 6.2.8, 6.2.9, 6.2.10, 6.2.13
# CENTOS6: 6.2.2, 6.2.3, 6.2.5, 6.2.6, 6.2.7, 6.2.8, 6.2.9, 6.2.10, 6.2.13, 6.2.14
# UBUNTU: 9.3.1, 9.3.2, 9.3.3, 9.3.6, 9.3.7, 9.3.8, 9.3.9, 9.3.10, 9.3.13, 9.3.14
include_recipe 'stig::sshd_config'

# RHEL6:  6.3.6
# CENTOS6: 6.3.4
# UBUNTU: 9.2.3
include_recipe 'stig::system_auth'

# RHEL6: 7.2.1, 7.2.2, 7.2.3
# CENTOS6: 7.1.1, 7.1.2, 7.1.3
# UBUNTU: 10.1.1, 10.1.2, 10.1.3
include_recipe 'stig::login_defs'

# RHEL6:  8.1, 8.1.1
# CENTOS6: 8.1, 8.2
# UBUNTU: 11.1, 11.2
include_recipe 'stig::login_banner'

# RHEL6:  6.1.3, 6.1.4, 6.1.5, 6.1.6, 6.1.7, 6.1.8, 6.1.9, 6.1.10, 9.1.1, 9.1.2, 9.1.3, 9.1.4, 9.1.5, 9.1.6, 9.1.7, 9.1.8
# CENTOS6: 6.1.3, 6.1.4, 6.1.5, 6.1.6, 6.1.7, 6.1.8, 6.1.9, 6.1.10, 9.1.2, 9.1.3, 9.1.4, 9.1.5, 9.1.6, 9.1.7, 9.1.8, 9.1.9
# UBUNTU: 9.1.2, 9.1.3, 9.1.4, 9.1.5, 9.1.6, 9.1.7, 9.1.8, 12.1, 12.2, 12.3, 12.4, 12.5, 12.6
include_recipe 'stig::file_permissions'

# RHEL6: 9.1.9, 9.1.0, 9.1.11, 9.2.1, 9.2.2, 9.2.3, 9.2.4, 9.2.5
# CENTOS6: 9.1.10, 9.1.11, 9.1.12, 9.2.1, 9.2.2, 9.2.3, 9.2.4, 9.2.5
# UBUNTU: 12.7, 12.8, 12.9, 13.1, 13.2, 13.3, 13.4, 13.5
include_recipe 'stig::audits'

# RHEL6: 9.1.12, 9.1.13, 9.2.6, 9.2.10, 9.2.11, 9.2.12, 9.2.15, 9.2.16, 9.2.18, 9.2.19
# CENTOS6: 9.1.13, 9.1.14, 9.2.6, 9.2.10, 9.2.11, 9.2.12, 9.2.14, 9.2.15, 9.2.16, 9.2.17
# UBUNTU: 12.10, 12.11, 13.6, 13.10, 13.11, 13.12, 13.14, 13.15, 13.16, 13.17
include_recipe 'stig::audit_scripts'

# CENTOS6: 6.5
include_recipe 'stig::su_restriction'
