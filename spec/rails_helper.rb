# require "coveralls"
# Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'support/test_helpers'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods
  config.include Support::TestHelpers

  config.before(:suite) do
   DatabaseCleaner.clean_with(:truncation)
 end

 config.before(:each) do
   DatabaseCleaner.strategy = :transaction
 end

 config.before(:each) do
   DatabaseCleaner.start
 end

 config.after(:each) do
   DatabaseCleaner.clean
 end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def login
  visit "/admin"
  fill_in "admin_user_email", with: "admin@example.com"
  fill_in "admin_user_password", with: "password"
  click_button "Login"
end
