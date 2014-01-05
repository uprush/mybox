#!/bin/bash

HERE=`dirname $0`
HERE=`cd $HERE; pwd`

git submodule update --init

sudo mkdir -p /var/chef/cache
if [ ! -L /var/chef/cookbooks ]; then
  sudo ln -s "$HERE/cookbooks" /var/chef/cookbooks
fi
if [ ! -L /var/chef/opscode-cookbooks ]; then
  sudo ln -s "$HERE/opscode-cookbooks" /var/chef/opscode-cookbooks
fi

ruby $HERE/yaml2json.rb

sudo chef-solo -c "$HERE/solo.rb" -j "/tmp/mybox.json" "$@"
