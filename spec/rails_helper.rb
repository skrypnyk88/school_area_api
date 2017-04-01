require 'database_cleaner'
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'
require 'support/factory_girl'

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  Shoulda::Matchers.configure do |conf|
    conf.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  	DatabaseCleaner.clean_with(:truncation)
     DatabaseCleaner.strategy = :transaction
   end
   config.around(:each) do |example|
     DatabaseCleaner.cleaning do
       example.run
     end
   end
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
