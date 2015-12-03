$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "portfolio/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "portfolio"
  s.version     = Portfolio::VERSION
  s.authors     = ["Eduardo Messuti"]
  s.email       = ["messuti.edd@gmail.com"]
  s.homepage    = "http://edd.bz"
  s.summary     = "Portfolio site builder."
  s.description = "This gem allows you to easily create a Portfolio web site."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency 'devise'
  s.add_dependency 'paperclip', '~> 4.3'
  s.add_dependency 'redcarpet'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'bootstrap-sass-extras'

  s.add_development_dependency "sqlite3"
end
