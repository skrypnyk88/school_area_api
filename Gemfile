source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'jbuilder', '~> 2.5'
gem 'jwt', '~> 1.5', '>= 1.5.6'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.0'
gem 'rack-cors', '~> 0.4.1', require: 'rack/cors'
gem 'rails', '~> 5.0.2'
gem 'rubocop', '~> 0.47.1'

group :development, :test do
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry-byebug', '~> 3.3'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '>= 1.5.3'
  gem 'faker', '~> 1.7', '>= 1.7.3'
  gem 'shoulda-matchers', '~> 3.1'
end
