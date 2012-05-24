# Load the rails application
require File.expand_path('../application', __FILE__)

# Inserted by NetBeans Ruby support to support JRuby
if defined?(JRUBY_VERSION)
  require 'rubygems'
  gem 'activerecord-jdbc-adapter'
  require 'jdbc_adapter'
end

# Initialize the rails application
Meetmanager::Application.initialize!
