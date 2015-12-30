source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.1.10'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'friendly_id', '~> 5.1.0'
gem "font-awesome-rails"
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'simple_form'
gem 'devise'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring', group: :development
gem 'coveralls', require: false
gem "foreman"
gem 'puma'

group :production, :staging do
  gem "rails_12factor"
  gem "rails_stdout_logging"
  gem "rails_serve_static_assets"
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers', '~> 3.0'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist', '1.5.1'
  gem 'database_cleaner',     '1.4.0'
end
