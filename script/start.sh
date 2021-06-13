#!/usr/bin/env sh
rails_env=${RAILS_ENV:-development}
echo ==rails env: $rails_env

export APP_ROLE=${APP_ROLE:-default}
echo ==running as $APP_ROLE role...

case "$APP_ROLE" in
  web|default)
    bundle exec puma -C config/puma.rb
    ;;
  sidekiq)
    bundle exec sidekiq
    ;;
  *)
    echo Err: unknow APP_ROLE: $APP_ROLE
    exit 1
    ;;
esac

