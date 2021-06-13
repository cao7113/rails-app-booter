class Setting < Settingslogic
  source "config/settings.yml"
  namespace Rails.env
end