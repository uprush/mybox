default[:mybox][:user] = 'vagrant'
default[:mybox][:home] = "/home/#{node['mybox']['user']}"
