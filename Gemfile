source 'https://rubygems.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# Use Haml for views
gem 'haml-rails'
# Sass-powered version of Bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
# Autoprefixer with Bootstrap to add browser vendor prefixes automatically
gem 'autoprefixer-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Devise: login system
gem 'devise'
# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem "figaro"
# Whenever is a Ruby gem that provides a clear syntax for writing and deploying cron jobs.
gem 'whenever', :require => false
# Best in Place is a jQuery based AJAX Inplace-Editor that takes profit of RESTful server-side controllers to allow users to edit stuff with no need of forms.
gem "best_in_place"

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'sqlite3'
  gem 'thin'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development, :test do
  gem 'did_you_mean'
  gem 'better_errors'
  # gem 'jazz_hands'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

