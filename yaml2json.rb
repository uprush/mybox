#!/usr/bin/env ruby

require 'yaml'
require 'json'

env = "linux"
env = "mac" if RUBY_PLATFORM.include?("darwin")

here = File.expand_path(File.dirname(__FILE__))
attr_file = File.join(here, "./attributes/#{env}.yml")
attrs = YAML.load(File.read(attr_file))

solo_attr = "/tmp/mybox.json"
File.open(solo_attr, "w") { |f| f.write(JSON.pretty_generate(attrs)) }
