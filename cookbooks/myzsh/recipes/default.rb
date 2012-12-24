include_recipe "zsh"

myuser = node[:myzsh][:user]

# Install oh-my-zsh
git "/home/#{myuser}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

# .zshrc file
template "/home/#{myuser}/.zshrc" do
  source "zshrc.erb"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end

# zsh completions
directory "/home/#{myuser}/.oh-my-zsh/completions" do
  owner myuser
  group myuser
  mode 0755
  action :create
end

# change default shell
execute "change default shell" do
  command "chsh -s /bin/zsh"
  action :run
end