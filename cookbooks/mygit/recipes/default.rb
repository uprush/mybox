include_recipe "git"

myuser = node[:mygit][:user]

# .gitconfig file
template "/home/#{myuser}/.gitconfig" do
  source "gitconfig.erb"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end

# .gitignore file
cookbook_file "/home/#{myuser}/.gitignore" do
  source "gitignore"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end

# zsh completions
directory "/home/#{myuser}/.oh-my-zsh/completions/_git" do
  owner myuser
  group myuser
  mode 0755
  action :create
end

# .git-completion.bash file
cookbook_file "/home/#{myuser}/.oh-my-zsh/completions/_git/git-completion.bash" do
  source "git-completion.bash"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end

# .git-completion.zsh file
cookbook_file "/home/#{myuser}/.oh-my-zsh/completions/_git/git-completion.zsh" do
  source "git-completion.zsh"
  owner myuser
  group myuser
  mode 0644
  action :create_if_missing
end
