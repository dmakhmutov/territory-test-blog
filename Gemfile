source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'dry-validation'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-its'
  gem 'rspec-json_expectations'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'shoulda-matchers', '>= 3.1'

  gem 'pronto', require: false
  gem 'pronto-brakeman', require: false
  gem 'pronto-rubocop', require: false
  gem 'pronto-reek', require: false
  gem 'rubocop-rspec'
end
