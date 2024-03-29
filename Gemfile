source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3.2'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# use devise for authentication
gem 'devise'
gem 'easy_monitor', :git => 'git://github.com/wildeng/easy_monitor.git', :tag => "v0.2.0"
# state machine
gem 'aasm'
# tags to identify articles
gem 'acts-as-taggable-on', '~> 6.0'
# style using bootsrap
gem 'bootstrap'
gem 'jquery-rails'
gem 'font-awesome-rails'
# pagination
gem 'will_paginate'
# markdown gem
gem 'redcarpet'
# syntax higlights
gem 'coderay'
# searching
gem 'pg_search'

# Use twitter security Gem
gem 'secure_headers'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'simplecov', :require => false, :group => :test

group :development, :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'brakeman'
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'faker'
  # get a debugger console
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem 'listen'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'rubocop', require: false
  gem 'rubocop-faker'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
