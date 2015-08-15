# Rails Portfolio

Easily build a minimalistic portfolio page by dropping this gem into your rails project.

## Dependencies

This gem depends on [paperclip](https://github.com/thoughtbot/paperclip), so make sure you meet all its [requirements](https://github.com/thoughtbot/paperclip#requirements) (e.g. ImageMagick).

If you go with our default authorization system we'll also depend on [devise](https://github.com/plataformatec/devise).

## Installation

### 1) Add it to your Gemfile 

```ruby
gem 'rails-portfolio'
```

And run `bundle install`.

### 2) Mount the engine

Add the following line to your `config/routes.rb`:

```ruby
mount Portfolio::Engine, at: '/portfolio'
```

Make sure you have a root path defined too. If you'd like to point the root path at your portfolio, do it as follows:

```ruby
root 'portfolio/items#default'
```

### 3) Set up assets

Add the following to your `application.js` right after `jquery`:

```javascript
//= require portfolio/application
```

Add the following to your `application.css`:

```css
/*
 *= require portfolio/application
 */
```

### 4) Define your authorization method
If you don't have an authorization method already in place, you don't have to do anything and we'll setup an admin_user table and login interface for you (through `devise`), if you'd like to use your own auth method you'll have to:

Create and initializer in `config/initializers/portfolio.rb` with your authorization method inside as follows:

```ruby
Portfolio.setup do |config|
  config.auth_method = :custom
  config.auth_action = :my_auth_action!
end
```

`my_auth_action!` is the method that'll be called before enabling the user to access the portfolio admin panel, so make sure it exists and only returns true when properly authorized.

### 5) Migrations
1. Run: `rake portfolio:install:migrations` to copy the portfolio migrations into your project.
2. Run `rake db:migrate` to execute them.

### 6) Create an admin user

`rake portfolio:create_admin_user[your@admin_email.com,your_secure_password]`

## Usage

Once installed you can start setting up your portfolio by going to `/portfolio/admin`.

Create a portfolio item and set it as default, then you'll be able to access it from `/portfolio` or wherever you decide to mount the engine. 
