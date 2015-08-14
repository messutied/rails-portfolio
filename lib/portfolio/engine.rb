require 'paperclip'
require 'devise'
require 'redcarpet'
require 'bootstrap-sass'
require 'bootstrap-sass-extras'


module Portfolio
  class Engine < ::Rails::Engine
    isolate_namespace Portfolio

    config.to_prepare do
      require_relative './custom_failure'
    end
  end
end
