include_recipe 'aufs'

tutum_repo_url = 'http://repo.tutum.co'
gpg_url = "https://files.tutum.co/keys/#{node[:tutum][:gpg_key_id]}.pub"

case node['platform_family']
  when 'debian' || 'ubuntu'
    apt_repository 'tutum-repository' do
      uri   tutum_repo
      gpg   gpg_url
      distribution 'ubuntu'
      components ['main']
    end
  when 'centos' || 'fedora'
    yum_repository 'tutum-repository' do
      baseurl "#{tutum_repo}/redhat/$basearch"
      gpg gpg_url0
      action :create
    end
end

package 'tutum-agent'

