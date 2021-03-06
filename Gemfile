source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'capistrano'
gem 'rvm-capistrano'
gem 'passenger', '3.0.12'

gem 'taps'
gem 'sqlite3'

gem 'therubyracer'
gem 'jquery-rails'
gem 'haml-rails'
gem 'hirb'
gem 'twitter-bootstrap-rails'
gem 'awesome_print'
gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

gem 'devise'
gem 'simple_form'
gem 'will_paginate'
gem 'carrierwave'
gem 'rmagick'
gem 'ancestry'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pg'
  gem "rspec-rails", "~> 2.6"
  # on mac os
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-livereload' if RUBY_PLATFORM =~ /darwin/i
  #testing & coverage
  gem "simplecov", :require => false
  gem "debugger"
end

group :test do
  gem 'turn', '0.8.2', :require => false # Pretty printed test output
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'spork', '~> 0.9.0.rc'
  gem 'guard-spork'
  gem 'shoulda'
  gem 'rb-inotify' if RUBY_PLATFORM =~ /linux/i # on linux
  gem 'libnotify' if RUBY_PLATFORM =~ /linux/i # on linux
end

group :production do
  gem 'mysql2'
end
