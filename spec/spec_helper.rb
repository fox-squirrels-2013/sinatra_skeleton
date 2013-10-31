require_relative '../app.rb'
require 'shoulda-matchers'
require 'rack/test'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before do
    User.destroy_all
  end
end
