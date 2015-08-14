require 'paperclip'
require 'devise'
require 'redcarpet'
require 'bootstrap-sass'
require 'bootstrap-sass-extras'

module Portfolio
  class Engine < ::Rails::Engine
    isolate_namespace Portfolio
  end
end
