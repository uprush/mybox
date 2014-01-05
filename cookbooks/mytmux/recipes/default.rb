case node['platform_family']
when "mac_os_x"
  bash "install tmux" do
    user "root"
    code "brew install tmux"
    not_if { ::File.exists?("/usr/local/bin/tmux") }
  end
else
  include_recipe "tmux"
end

myuser = node[:mybox][:user]
mygroup = node[:mybox][:group]
myhome = node[:mybox][:home]

# .tmux.conf file
cookbook_file "#{myhome}/.tmux.conf" do
  source "tmux.conf"
  owner myuser
  group mygroup
  mode 0644
  action :create
end
