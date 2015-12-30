require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'

Capybara.javascript_driver = :poltergeist
RSpec.configure do |config|
  config.include Capybara::DSL, type: :request
end
