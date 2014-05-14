user 'deploy' do
  action :create
  system true
  shell '/bin/false'
end

directory '/opt/deploy' do
  owner 'deploy'
  group 'deploy'
  mode '0755'
  action :create
end

directory '/opt/deploy/sample-app' do
  owner 'deploy'
  group 'deploy'
  mode '0755'
  action :create
end

git '/opt/deploy/sample-app' do
  repository 'https://github.com/patarleth/sample-express-app.git'
  revision 'master'
  action :sync
end

execute 'npm_install' do
  command 'npm install'
  cwd '/opt/deploy/sample-app'
end

bash 'pown' do
  code <<-EOH
chown -R deploy:deploy /opt/deploy
  EOH
end
