ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test
set :root, Dir.pwd()

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

Capybara.app = Sinatra::Application
set :show_exceptions, false
require './app'

RSpec.configure do |config|
  config.before :each do
    Band.all.each do |band|
      band.destroy
    end
    Venue.all.each do |venue|
      venue.destroy
    end
  end
  config.after :each do
    Band.all.each do |band|
      band.destroy
    end
    Venue.all.each do |venue|
      venue.destroy
    end
  end
end
