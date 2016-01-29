# Rails Portfolio

[![Build Status](https://travis-ci.org/messuti-edd/rails-portfolio.svg?branch=master)](https://travis-ci.org/messuti-edd/rails-portfolio)

Easily build a minimalistic portfolio site by dropping this gem into your rails project.

See an example site at: http://edd.bz.

## Dependencies

This gem depends on [paperclip](https://github.com/thoughtbot/paperclip), so make sure you meet all its [requirements](https://github.com/thoughtbot/paperclip#requirements) (e.g. ImageMagick).

If you go with our default authorization system we'll also depend on [devise](https://github.com/plataformatec/devise).

## Installation

### 1) Add it to your Gemfile

```ruby
gem 'rails-portfolio'
```

And run `bundle install`.

### 2) Install

Run the following command:

	rails generate portfolio:install

This will create:

- config/initializers/portfolio.rb

And insert code into:

- config/routes.rb
- app/assets/javascripts/application.js
- app/assets/stylesheets/application.css

Make sure you have a root path defined. If you'd like to point the root path at your portfolio, uncomment the line:

```ruby
root 'portfolio/sites#default'
```

### 3) Define your authorization method
If you don't have an authorization method already in place, you don't have to do anything and we'll setup an admin_user table and login interface for you (through [devise](https://github.com/plataformatec/devise)), if you'd like to use your own auth method you'll have to uncomment the following lines in `config/initializers/portfolio.rb`:

```ruby
Portfolio.setup do |config|
  config.auth_method = :custom
  config.auth_action = :my_auth_action!
end
```

`my_auth_action!` is the method that'll be called before enabling the user to access the portfolio admin panel, so make sure it exists and only returns `true` when properly authorized.

### 4) Migrations
1. Run: `rake portfolio:install:migrations` to copy the portfolio migrations into your project.
2. Run `rake db:migrate` to execute them.

### 6) Create an admin user
If you are using our authorization method you'll need to create an admin user
in order to access your new admin panel, do so by running:

```
rake portfolio:create_admin_user[your@admin_email.com,your_secure_password]
```

## Usage

Once installed you can start setting up your portfolio by going to `/portfolio/admin` (if mounted under `/portfolio`).

Create a portfolio item and set it as default, then you'll be able to access it from `/portfolio` or wherever you decide to mount the engine.
