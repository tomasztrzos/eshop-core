source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'passenger', '~> 6.0', require: 'phusion_passenger/rack_handler'
gem 'bcrypt', '~> 3.1.7'
gem 'doorkeeper', '~> 5.0', '>= 5.0.2'
gem 'fast_jsonapi', '~> 1.5'
gem 'rolify', '~> 5.2'

# Google Cloud Platform
gem 'google-cloud-pubsub', '~> 0.33.2'
gem 'googleauth'
gem 'google-cloud-storage', '~> 1.15'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'pry-remote', '~> 0.1.8'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
  gem 'fuubar', '~> 2.3', '>= 2.3.2'
  gem 'rubocop', '~> 0.61.1'
end

group :test do
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'database_cleaner', '~> 1.7'
  gem 'faker', '~> 1.9', '>= 1.9.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
