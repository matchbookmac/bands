ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test
set :root, Dir.pwd()

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

Capybara.app = Sinatra::Application
set :show_exceptions, false
require './app'
