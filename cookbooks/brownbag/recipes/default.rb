#
# Cookbook Name:: brownbag
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Install nginx and node.js.
include_recipe 'nginx'
include_recipe 'nodejs'

# Get rid of the default website.
file '/etc/nginx/sites-available/default' do
  action :delete
end

file '/etc/nginx/sites-enabled/000-default' do
  action :delete
end

file '/etc/nginx/conf/conf.d/default.conf' do
  action :delete
end

# Add the new sample site.
cookbook_file '/etc/nginx/sites-available/nodesite' do
  source 'nodesite'
  owner 'root'
  group 'root'
  mode '0755'
  manage_symlink_source true
end

# Symlink sites-available to sites-enabled.
# No need to specify link_type symbol. Default is symlink.
link '/etc/nginx/sites-enabled/nodesite' do
  to '/etc/nginx/sites-available/nodesite'
end

# Install forever npm package.
nodejs_npm 'forever'

# Create app directory.
directory '/var/www' do
  owner 'root'
  group 'root'
  mode '0755'
end

directory '/var/www/nodesite' do
  owner 'root'
  group 'root'
  mode '0755'
end

# Add app.js
cookbook_file '/var/www/nodesite/app.js' do
  source 'app.js'
  owner 'root'
  group 'root'
  mode '0755'
end

# Add node app files directory.
remote_directory '/var/www/nodesite/public' do
  source 'public'
  owner 'nginx'
  group 'root'
  mode '0755'
end

# Add the updated nginx conf.
cookbook_file '/etc/nginx/conf.d/default.conf' do
  source 'default.conf'
  owner 'root'
  group 'root'
  mode '0755'
end

# Use forever to start node.js.
execute 'stop_forever' do
  command 'forever stopall'
end

execute 'start_forever' do
  command 'forever start /var/www/nodesite/app.js'
end

# Restart nginx
service 'nginx' do
  action :restart
end
