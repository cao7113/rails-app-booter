generate :scaffold, 'note', 'title body:text publish_at:datetime'
generate "trestle:resource", "Note"
# route "root to: 'notes#index'"
rails_command "db:migrate"

# depends on factory_bot & faker
file "spec/factories/notes.rb", <<-File.strip_heredoc, force: true
  FactoryBot.define do
    factory :note do
      title { FFaker::Lorem.sentence() }
      body { FFaker::Lorem.sentences(rand(10)) }
      publish_at { rand(100).hours.ago }
    end
  end
File

def source_paths
  [__dir__]
end

copy_file "note/notes_admin.rb", "app/admin/notes_admin.rb", force: true

git add: '.'
git commit: "-m 'add note model'"