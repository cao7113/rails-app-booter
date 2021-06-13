# https://github.com/kaminari/kaminari

require 'bundler'
gem 'kaminari'

Bundler.with_unbundled_env do
  run "bundle install"
  generate 'kaminari:config'

  git add: '.'
  git commit: "-m 'add kaminari to paginate'"
end