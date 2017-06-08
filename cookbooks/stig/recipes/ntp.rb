platform = node['platform']

template '/etc/ntp.conf' do
  source 'etc_ntp_conf.erb'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(amazon).include? platform }
end

file '/etc/sysconfig/ntpd' do
  content 'OPTIONS="-u ntp:ntp"'
  owner 'root'
  group 'root'
  mode 0o644
  notifies :restart, "service[ntpd]"
  only_if { %w(amazon).include? platform }
end