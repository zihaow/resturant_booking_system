# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'dotenv-rails'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'pry'
gem 'pry-rails'
gem 'pry-rescue'
gem 'puma', '~> 5.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.1.7', '>= 6.1.7.7'
gem 'rswag-api'
gem 'rswag-ui'
gem 'simple_command'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'bullet'
end

group :test do
  gem 'dotenv-rails'
  gem 'factory_bot'
  gem 'faker'
  gem 'pry-stack_explorer'
  gem 'rails_best_practices'
  gem 'reek'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop', require: false
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
