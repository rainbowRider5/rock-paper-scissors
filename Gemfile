# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

# Web server
gem "puma", "~> 5.0"

# Frontend bundling
gem "sprockets-rails"
gem "importmap-rails"

# Views
gem "jbuilder"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-shopify", require: false
end

group :development do
  gem "web-console"
  gem "spring"
end

group :test do
end

gem "tailwindcss-rails", "~> 2.0"
