$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'portfolio/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails-portfolio'
  s.version     = Portfolio::VERSION
  s.authors     = ['Eduardo Messuti']
  s.email       = ['messuti.edd@gmail.com']
  s.homepage    = 'https://github.com/messuti-edd/rails-portfolio'
  s.summary     = 'Portfolio site builder.'
  s.description = 'This gem allows you to easily create a Portfolio web site to showcase your work.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'devise', '~> 3.5'
  s.add_dependency 'paperclip', '~> 4.3'
  s.add_dependency 'redcarpet', '~> 3.3'
  s.add_dependency 'bootstrap-sass', '~> 3.3'
  s.add_dependency 'bootstrap-sass-extras', '~> 0.0'
  s.add_dependency 'jquery-rails', '~> 4.0'

  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.5'
  s.add_development_dependency 'faker', '~> 1.5'
  s.add_development_dependency 'simplecov', '~> 0.11'
end
