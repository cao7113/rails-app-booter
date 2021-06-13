require 'bundler'

gem_group :development, :test do
  gem 'rspec-rails', '~> 5.0.0' # https://github.com/rspec/rspec-rails 
  gem 'factory_bot_rails' # https://github.com/thoughtbot/factory_bot_rails
  gem 'ffaker'  # https://github.com/ffaker/ffaker
  # rewrite of faker.
  # gem 'faker' # https://github.com/faker-ruby/faker
end

Bundler.with_unbundled_env do
  run "bundle install"
  generate "rspec:install"

  git add: '.'
  git commit: "-m 'add rspec'"
end