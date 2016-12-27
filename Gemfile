source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
gem 'bcrypt'

# I made this gem
gem 'vote_gem_jay'

gem 'pg'
gem 'puma'
gem 'simple_form'

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock'
end

group :development do
  gem 'quiet_assets'
  gem 'refills'
  gem 'rubocop', '~> 0.46.0', require: false
  gem 'spring'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rb-readline'
  gem 'rspec-rails', '~> 3.4.0'
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end

group :staging, :production do
  gem 'rack-timeout'
end
