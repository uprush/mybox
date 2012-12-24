include_recipe "tmux"

myuser = node[:mytmux][:user]

# .tmux.conf file
cookbook_file "/home/#{myuser}/.tmux.conf" do
  source "tmux.conf"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end
