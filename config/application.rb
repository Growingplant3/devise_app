require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module DeviseApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
    end

    config.generators.system_tests = nil
    config.time_zone = 'Tokyo'
  end
end
