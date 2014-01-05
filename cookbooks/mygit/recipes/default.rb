# case node['platform_family']
# when "mac_os_x"
#   bash "install git" do
#     user "root"
#     code "brew install git"
#     not_if { ::File.exists?("/usr/bin/git") }
#   end
# else
#   include_recipe "git"
# end

myuser = node[:mybox][:user]
mygroup = node[:mybox][:group]
myhome = node[:mybox][:home]

# .gitconfig file
template "#{myhome}/.gitconfig" do
  source "gitconfig.erb"
  owner myuser
  group mygroup
  mode 0644
  action :create
end

# .gitignore file
cookbook_file "#{myhome}/.gitignore" do
  source "gitignore"
  owner myuser
  group mygroup
  mode 0644
  action :create
end

# # zsh completions
# directory "#{myhome}/.oh-my-zsh/completions/_git" do
#   owner myuser
#   group mygroup
#   mode 0755
#   action :create
# end

# # .git-completion.bash file
# cookbook_file "#{myhome}/.oh-my-zsh/completions/_git/git-completion.bash" do
#   source "git-completion.bash"
#   owner myuser
#   group mygroup
#   mode 0644
#   action :create_if_missing
# end

# # .git-completion.zsh file
# cookbook_file "#{myhome}/.oh-my-zsh/completions/_git/git-completion.zsh" do
#   source "git-completion.zsh"
#   owner myuser
#   group mygroup
#   mode 0644
#   action :create_if_missing
# end
