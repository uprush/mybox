include_recipe "tmux"

myuser = node[:myvim][:user]

# .tmux.conf file
cookbook_file "/home/#{myuser}/.tmux.conf" do
  source "tmux.conf"
  owner myuser
  group myuser
  mode 0644
end
