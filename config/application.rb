require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Joerisdonmusic
  class Application < Rails::Application
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "8322da93-f1ea-40dc-be10-135be461d1dd" }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
