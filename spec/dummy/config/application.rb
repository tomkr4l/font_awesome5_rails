require_relative 'boot'

require 'rails'
require 'rails/all'

Bundler.require(:default, Rails.env)

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.encoding = "utf-8"
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.load_defaults 5.1
  end
end

