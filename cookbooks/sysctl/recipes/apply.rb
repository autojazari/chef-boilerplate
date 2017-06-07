#
# Cookbook Name:: sysctl
# Recipe:: apply
#
# Copyright 2014, OneHealth Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'sysctl::default'

ruby_block 'notify-apply-sysctl-params' do
  block do
  end
  notifies :run, 'ruby_block[apply-sysctl-params]', :immediately
end

execute 'reload_sysctl' do
  command 'sysctl -p'
  only_if { %w(amazon).include? platform }
end