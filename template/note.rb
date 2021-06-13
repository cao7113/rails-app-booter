generate :scaffold, 'note', 'title body publish_at:datetime'
generate "trestle:resource", "Note"
# route "root to: 'notes#index'"
rails_command "db:migrate"

# depends on factory_bot & faker
file "spec/factories/notes.rb", <<-File.strip_heredoc, force: true
  FactoryBot.define do
    factory :note do
      title { Faker::Lorem.sentence(word_count: 6) }
      body { Faker::Lorem.paragraph(sentence_count: 3) }
      publish_at { rand(100).hours.ago }
    end
  end
File

git add: '.'
git commit: "-m 'add note model'"