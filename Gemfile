source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'dotenv-rails'
gem 'devise'
gem 'jwt'
gem 'rack-cors', require: 'rack/cors'
gem 'pry'
gem 'pry-rails'
gem 'pry-rescue'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'simple_command'
gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'reek'
  gem 'dotenv-rails'
  gem 'faker'
  gem 'pry-stack_explorer'
  gem 'rails_best_practices'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop', require: false
  gem 'shoulda-matchers'
  gem 'factory_bot'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
