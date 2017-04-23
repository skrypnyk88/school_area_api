require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SchoolAreaApi
  class Application < Rails::Application
    config.api_only = true
    config.paths.add 'lib', eager_load: true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any,
                      methods: [:get, :post, :put, :patch, :delete, :options],
                      expose: ['Auth-Token']
      end
    end
<<<<<<< 4c2c86725e9454e52a38e519030d76f860dc676a

    Rack::Utils::SYMBOL_TO_STATUS_CODE[:authentication_timeout] = 419
=======
  Rack::Utils::SYMBOL_TO_STATUS_CODE[:authentication_timeout] = 419
>>>>>>> LVRUBYM-219: change report time controller
  end
end
