# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name          = "mongoid-flags"
  gem.version       = '0.0.1'
  gem.homepage      = "http://github.com/tjackiw/mongoid-flags"
  gem.license       = "MIT"
  gem.summary       = %Q{Simple record flagging system for Mongoid documents}
  gem.description   = %Q{Simple record flagging system for Mongoid documents}
  gem.authors       = ["Thiago Jackiw"]
  gem.email         = "tjackiw@gmail.com"
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
end
Jeweler::RubygemsDotOrgTasks.new

task :default => :spec

desc "Run all specs"
task "spec" do
  exec "bundle exec rspec spec"
end