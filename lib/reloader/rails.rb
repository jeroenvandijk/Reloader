require 'rack/javascript_inject'

module Reloader
  class Engine < ::Rails::Engine

    if ::Rails.env.development?

      initializer "reloader.sass_rack_reorder" do
        middleware = Rails.application.config.middleware
        middleware.insert_before(::ActionDispatch::Static,
                                 ::Sass::Plugin::Rack)
      end
      
      config.app_middleware.use Rack::JavascriptInject
    end
    
  end
end