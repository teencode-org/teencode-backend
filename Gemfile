source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use Postgres as the database for Active Record
gem "pg"
# Use Puma as the app server
gem 'puma', '~> 4.3'
gem "bootstrap-sass"
gem "bootstrap-select-rails"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "sidekiq"
gem "redis"
gem "redis-namespace"
gem 'rack-cors'
gem 'active_model_serializers'
gem 'activeadmin', github: 'activeadmin'
gem 'devise'
gem "kaminari"
gem 'tinymce-rails'
gem "sentry-raven"
gem 'promise.rb'

# gem 'bootstrap-sass', '~> 3.3.6'
# gem 'sass-rails', '>= 3.2'

group :production do
  gem "rails_12factor"
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'coveralls', require: false
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem "letter_opener"
  gem 'capybara'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rubocop'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use figro to handle env variables
gem "figaro"
