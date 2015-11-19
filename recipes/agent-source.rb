deploy 'tutum-agent' do
  repo 'https://github.com/tutumcloud/tutum-agent.git'
  deploy_to '/opt/tutum-agent'
  action :deploy
end
