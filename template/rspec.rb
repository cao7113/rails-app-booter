require 'bundler'

gem_group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
  # gem 'ffaker'
end

Bundler.with_clean_env do
  run "bundle install"
  generate "rspec:install"

  git add: '.'
  git commit: "-m 'add rspec'"
end