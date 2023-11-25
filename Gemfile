source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.2"
gem "puma", ">= 5.0"
gem "pg", "~> 1.1"
gem 'email_validator', require: 'email_validator/strict'

gem 'devise'

gem "bootsnap", require: false

# front-end stackgem install email_validator
gem "importmap-rails"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "image_processing", "~> 1.2"

group :development, :test do
  gem "byebug", "~> 11.1", ">= 11.1.3"
  gem "pry", "~> 0.14.2"
  gem "pry-byebug", "~> 3.10", ">= 3.10.1"
  gem "pry-rails", "0.3.9"
end

group :development do
  gem "web-console"
  gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers", "= 5.3.0"
end

gem "tzinfo-data"