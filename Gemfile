source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


gem 'execjs' # For JS Compilation
gem 'therubyracer' # JS Interpreter

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'

end

gem 'jquery-rails'
gem 'scoped_search' # For Searching
gem 'kaminari' # For Pagination

group :test, :development do
	gem 'sqlite3'
	gem 'turn', '<0.8.3'
	gem 'rspec-rails'
	gem 'capybara'
	gem 'guard-rspec'
	gem 'growl_notify'
	gem 'launchy'
	gem 'capistrano' #You don't want Capistrano on the production side (I think)
end

group :production do
	gem 'pg' #use postgres for database installation
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

