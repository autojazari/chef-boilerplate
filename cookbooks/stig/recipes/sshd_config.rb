# Cookbook Name:: stig
# Recipe:: sshd_config
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Configure SSHd
#
# CIS Benchmark Items
# RHEL6: 6.2.2, 6.2.3, 6.2.5, 6.2.6, 6.2.7, 6.2.8, 6.2.9, 6.2.10, 6.2.13
# CENTOS6: 6.2.2, 6.2.3, 6.2.5, 6.2.6, 6.2.7, 6.2.8, 6.2.9, 6.2.10, 6.2.11, 6.2.13, 6.2.14
# UBUNTU: 9.3.1, 9.3.2, 9.3.3, 9.3.6, 9.3.7, 9.3.8, 9.3.9, 9.3.10, 9.3.13, 9.3.14
#
# - Set LogLevel to INFO
# - Set Permissions on /etc/ssh/sshd_config
# - Set SSH MaxAuthTries to 4 or Less
# - Set SSH IgnoreRhosts to Yes
# - Set SSH HostbasedAuthentication to No
# - Disable SSH Root Login
# - Set SSH PermitEmptyPasswords to No
# - Do Not Allow Users to Set Environment Options
# - Limit Access via SSH

vars = node['stig']['sshd_config'].dup

valid_allow_tcp_forwarding_values = %w(yes no local remote all)
raise "node['stig']['sshd_config']['allow_tcp_forwarding'] must be one of #{valid_allow_tcp_forwarding_values}" unless valid_allow_tcp_forwarding_values.include?(vars['allow_tcp_forwarding'])

# Check if the following attributes have a yes/no String assigned
%w(
  allow_agent_forwarding
  host_based_uses_name_from_packet_only
  gss_api_authentication
  gss_api_key_exchange
  gss_api_store_credentials_on_rekey
  gss_api_strict_acceptor_check
  gss_cleanup_credentials
  host_based_auth
  host_based_uses_name_from_packet_only
  ignore_rhosts
  ignore_user_known_hosts
  permit_root_login
  permit_empty_passwords
  allow_users_set_env_opts
  password_authentication
  kerberos_authentication
  kerberos_or_local_passwd
  kerberos_ticket_cleanup
  kerberos_use_kuserok
  print_last_log
  print_motd
  pub_key_authentication
  rsa_authentication
  rhosts_rsa_authentication
  show_patch_level
  strict_modes
  tcp_keepalive
  use_dns
  use_login
  use_privilege_separation
  x_11_forwarding
  x_11_use_local_host
).each do |v|
  raise "node['stig']['sshd_config']['#{v}'] must be a 'yes' or 'no'" unless %w(yes no).include?(vars[v])
end

# Check that an attribute is an array
%w(
  host_key
  port
).each do |a|
  raise "node['stig']['sshd_config']['#{a}'] must be an array" unless vars[a].is_a?(Array)
end

%w(
  x_11_display_offset
  server_key_bits
  max_auth_tries
  max_sessions
  login_grace_time
  key_regeneration_interval
  client_alive_interval
  client_alive_count_max
).each do |i|
  raise "node['stig']['sshd_config']['#{i}'] must be an integer" unless vars[i].is_a?(Integer)
end

valid_address_family = %w(any inet inet6)
raise "node['stig']['sshd_config']['address_family'] must be one of #{valid_address_family}" unless valid_address_family.include?(vars['address_family'])

valid_protocols = %w(1 2 1,2 2,1)
raise "node['stig']['sshd_config']['protocol'] must be one of #{valid_protocols}" unless valid_protocols.include?(vars['protocol'])

valid_gateway_ports = %w(yes no clientspecified)
raise "node['stig']['sshd_config']['gateway_ports'] must be one of #{valid_gateway_ports}" unless valid_gateway_ports.include?(vars['gateway_ports'])

valid_compression = %w(yes no delayed)
raise "node['stig']['sshd_config']['compression'] must be one of #{valid_compression}" unless valid_compression.include?(vars['compression'])

valid_log_level = %w(QUIET FATAL ERROR INFO	VERBOSE DEBUG DEBUG1 DEBUG2 DEBUG3)
raise "node['stig']['sshd_config']['log_level'] must be one of #{valid_log_level}" unless valid_log_level.include?(vars['log_level'])

valid_permit_tunnel = %w(yes no ethernet point-to-point)
raise "node['stig']['sshd_config']['permit_tunnel'] must be one of #{valid_permit_tunnel}" unless valid_permit_tunnel.include?(vars['permit_tunnel'])

valid_syslog_facility_level = %w(DAEMON USER AUTH AUTHPRIV LOCAL0 LOCAL1 LOCAL2 LOCAL3 LOCAL4 LOCAL5 LOCAL6 LOCAL7)
raise "node['stig']['sshd_config']['syslog_facility'] must be one of #{valid_syslog_facility_level}" unless valid_syslog_facility_level.include?(vars['syslog_facility'])

template '/etc/ssh/sshd_config' do
  source 'etc_ssh_sshd_config.erb'
  mode 0o600
  owner 'root'
  group 'root'
  variables(vars)
  notifies :restart, 'service[sshd]', :delayed
end

service 'sshd' do
  action :nothing
end
