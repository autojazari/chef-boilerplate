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

file '/etc/chrony/chrony.conf' do
  content 'server 0.amazon.pool.ntp.org'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(debian ubuntu).include? platform }
end

# update-grub
execute 'update_grub' do
  user 'root'
  command "update-grub"
  action :run
  only_if { %w(debian ubuntu).include? platform }
end