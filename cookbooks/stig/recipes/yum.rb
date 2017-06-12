platform = node['platform']

template '/etc/yum.repos.d/amzn-nosrc.repo' do
  source 'etc_yum.repos.d_amzn-nosrc.repo.erb'
  owner 'root'
  group 'root'
  mode 0o644
  only_if { %w(amazon debian ubuntu).include? platform }
end