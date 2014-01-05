myuser = node['mybox']['user']
myhome = node['mybox']['home']

bash "install Homebrew" do
  user "root"
  code 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  not_if { ::File.exists?("/usr/local/bin/brew") }
end

bash "Set up Sublime Text 2 CLI" do
  user myuser
  code <<-EOH
    mkdir #{myhome}/bin
    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" #{myhome}/bin/subl
    EOH
  not_if { ::File.exists?("#{myhome}/bin/subl") }
end
