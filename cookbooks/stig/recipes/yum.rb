platform = node['platform']

template '/etc/yum.repos.d/amzn-nosrc.repo' do
  source 'etc_yum.repos.d_amzn-nosrc.repo.erb'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(amazon).include? platform }
end

execute 'remove xorg-x11*' do
	command 'yum -y remove xorg-x11* && yum install -y java-1.7.0-openjdk'
end
