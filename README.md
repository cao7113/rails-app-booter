# Rails App Booter

Bootstrap new rails applications with app-templating help

## Application template

https://guides.rubyonrails.org/rails_application_templates.html

```bash
# create project using template
$ rails new blog -m ~/template.rb
$ rails new blog -m http://example.com/template.rb

# apply to existed app
$ rails app:template LOCATION=~/template.rb
$ rails app:template LOCATION=http://example.com/template.rb
```

### Advanced

The application template is evaluated in the context of a Rails::Generators::AppGenerator instance. It uses the apply action provided by Thor. This means you can extend and change the instance to match your needs.

## Resources 

https://guides.rubyonrails.org/generators.html

https://github.com/nickjj/docker-rails-example