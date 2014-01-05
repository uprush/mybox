case node['platform_family']
when "mac_os_x"
  # do nothing
else
  include_recipe "vim"
end

myuser = node[:mybox][:user]
mygroup = node[:mybox][:group]
myhome = node[:mybox][:home]

# the .vim directory
remote_directory "#{myhome}/.vim" do
  source "vim"
  owner myuser
  group mygroup
  mode 0755
end

# .vimrc file
cookbook_file "#{myhome}/.vimrc" do
  source "vimrc"
  owner myuser
  group mygroup
  mode 0644
  action :create_if_missing
end
