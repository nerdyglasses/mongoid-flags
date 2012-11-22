require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'mongoid'
require 'mongoid-flags'

Mongoid.load!("mongoid.yml", :test)

RSpec.configure do |config|
  config.after(:each) do
    Mongoid::Config.purge!
  end
end