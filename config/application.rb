require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Helloworld
  class Application < Rails::Application
    config.action_dispatch.default_headers['P3P'] = 'CP="Not used"'
    config.action_dispatch.default_headers.delete('X-Frame-Options')
    
    config.generators do |g|
      g.javascript_engine :js
    end
  end
end
