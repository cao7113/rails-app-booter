# https://github.com/TrestleAdmin/trestle

require 'bundler'

gem 'trestle'
gem 'trestle-auth'

Bundler.with_unbundled_env do
  run "bundle install"
  generate "trestle:install"
  # generate "trestle:resource Baby"

  model_name = "AdminUser" # default model: Administrator
  generate "trestle:auth:install #{model_name}"
  rails_command "db:migrate"

  git add: '.'
  git commit: "-m 'add trestle admin'"

  rakefile "#{model_name.underscore}.rake" do
    <<-Ruby.strip_heredoc
      namespace :admin do
        task user: :environment do
          email = "admin@local.host"
          attrs = {
            password: "password", 
            first_name: "Admin", 
            last_name: "User"
          }
          #{model_name}.create_with(attrs).find_or_create_by(email: email)
          puts "==created user: \#{email}"
        end
      end
    Ruby
  end

  # run rake task
  rails_command "admin:user"
end