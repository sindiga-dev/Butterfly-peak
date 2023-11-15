require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)

module ButterflyBackend
  class Application < Rails::Application
    config.load_defaults 7.0

    config.action_cable.mount_path = '/cable'
    config.action_cable.url = "ws://localhost:3000/cable"

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end

    config.middleware.use ActionDispatch::Flash
    config.action_dispatch.cookies_same_site_protection = :strict

    config.api_only = false
  end
end
