include_recipe "vim"

myuser = node[:myvim][:user]

# the .vim directory
remote_directory "/home/#{myuser}/.vim" do
  source "vim"
  owner myuser
  group myuser
  mode 0755
end

# .vimrc file
cookbook_file "/home/#{myuser}/.vimrc" do
  source "vimrc"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end
