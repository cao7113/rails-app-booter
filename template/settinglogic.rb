# https://github.com/settingslogic/settingslogic

require 'bundler'

gem "settingslogic"

def source_paths
  [__dir__]
end

copy_file "settinglogic/setting.rb", "app/models/setting.rb"
template "settinglogic/settings.yml", "config/settings.yml"

Bundler.with_unbundled_env do
  run "bundle install"

  git add: '.'
  git commit: "-m 'add settingslogic'"
end