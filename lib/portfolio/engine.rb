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

  class << self
    mattr_accessor :auth_method, :auth_action
    self.auth_method = :portfolio_admin_user
    self.auth_action = :authenticate_admin_user!
  end

  def self.setup(&block)
    yield self
  end
end
