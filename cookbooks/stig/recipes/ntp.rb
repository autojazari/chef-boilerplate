platform = node['platform']

package 'ntp'

package 'chrony' do
  action :install
  only_if { %w(ubuntu).include? platform }
end

package 'telnet' do
  action :purge
  only_if { %w(ubuntu).include? platform }
end


template '/etc/ntp.conf' do
  source 'etc_ntp_conf.erb'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(amazon debian ubuntu).include? platform }
end

directory '/etc/chrony' do
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(debian ubuntu).include? platform }
end

file '/etc/chonry/chrony.conf' do
  content 'server 0.amazon.pool.ntp.org'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(debian ubuntu).include? platform }
end

# file '/etc/sysconfig/ntpd' do
#   content 'OPTIONS="-u ntp:ntp"'
#   owner 'root'
#   group 'root'
#   mode 0o644
#   notifies :restart, "service[ntpd]"
#   only_if { %w(amazon).include? platform }
# end

# service 'ntpd' do
#   action :nothing
# end

# execute 'copy_ubuntu_crontab' do
#   user 'root'
#   command "crontab -l >> /etc/cron.daily/aide"
#   action :run
#   not_if 'cat /etc/cron.daily/aide | grep sbin | grep 5'
#   only_if { %w(ubuntu).include? platform }
# end
