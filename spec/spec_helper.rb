require 'rspec'
require 'capybara/rspec'
require 'sinatra/flash'

require_relative '../app.rb'

set :environment, :test

Capybara.app = Sinatra::Application
