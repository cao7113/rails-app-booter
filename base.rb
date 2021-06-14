gem_group :development, :test do
  gem 'dotenv-rails'
end

def source_paths
  [__dir__]
end

# require 'byebug'
# byebug
template "base/README.md", "README.md", force: true

after_bundle do
  # git :init
  git add: '.'
  git commit: "-m 'init commit'"
end