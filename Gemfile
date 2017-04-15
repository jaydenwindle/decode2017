ruby '2.3.3'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# backend deps
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'shopify_api'
gem 'shopify_app'
gem 'activeresource', github: 'rails/activeresource'
gem 'dotenv-rails', groups: [:development, :test]
gem 'httparty'

# frontend deps
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'sprockets'
gem 'sprockets-es6'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# development & test env
group :development, :test do
  gem 'byebug', platform: :mri
end

# development setup
group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# production setup
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'rack-cache', :require => 'rack/cache'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]