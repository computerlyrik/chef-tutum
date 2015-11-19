#
# Cookbook Name:: tutum
# Recipe:: agent
#
# Copyright 2015, computerlyrik, Christian Fischer
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

tutum_repo_url = 'http://repo.tutum.co'
gpg_key_url = "https://files.tutum.co/keys/#{node[:tutum][:gpg_key_id]}.pub"

case node['platform_family']
  when 'debian' || 'ubuntu'
    include_recipe 'aufs'
    apt_repository 'tutum-repository' do
      uri   "#{tutum_repo_url}/ubuntu"
      key   gpg_key_url
      distribution 'tutum'
      components ['main']
      #cache_rebuild true
    end
  when 'rhel' || 'fedora'
    yum_repository 'tutum-repository' do
      description "Tutum repository"
      baseurl "#{tutum_repo_url}/redhat/$basearch"
      gpgkey gpg_key_url
      action :create
    end
end

package 'tutum-agent'

directory '/etc/tutum/agent' do
  recursive true
  subscribes :create, 'package[tutum-agent]', :immediately
end

template '/etc/tutum/agent/tutum-agent.conf' do
  action :nothing
  subscribes :create, 'package[tutum-agent]', :immediately
end

service 'tutum-agent' do
  ignore_failure true
  action [:enable, :start]
end
