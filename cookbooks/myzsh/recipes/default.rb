case node['platform_family']
when "mac_os_x"
  bash "install zsh" do
    user "root"
    code "brew install zsh"
    not_if { ::File.exists?("/bin/zsh") }
  end
else
  include_recipe "zsh"
end

myuser = node[:mybox][:user]
mygroup = node[:mybox][:group]
myhome = node[:mybox][:home]

# Install oh-my-zsh
git "#{myhome}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

# .zshrc file
template "#{myhome}/.zshrc" do
  source "zshrc.erb"
  owner myuser
  group mygroup
  mode 0644
  action :create
end

# zsh completions
directory "#{myhome}/.oh-my-zsh/completions" do
  owner myuser
  group mygroup
  mode 0755
  action :create
end

# change default shell
execute "change default shell" do
  command "chsh -s /bin/zsh"
  action :run
end