generate :scaffold, 'blog', 'title content publish_at:datetime'
generate "trestle:resource", "Blog"
route "root to: 'blogs#index'"
rails_command "db:migrate"

# depends on factory_bot & faker
file "spec/factories/blogs.rb", <<-File.strip_heredoc, force: true
  FactoryBot.define do
    factory :blog do
      title { Faker::Lorem.sentence(word_count: 6) }
      blog { Faker::Lorem.paragraph(sentence_count: 3) }
      publish_at { rand(100).hours.ago }
    end
  end
File

git add: '.'
git commit: "-m 'add blog model'"