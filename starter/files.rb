def source_paths
  [__dir__]
end

template "app/Taskfile.yml", "Taskfile.yml", force: true
template "app/Dockerfile", "Dockerfile", force: true
copy_file "app/.dockerignore", ".dockerignore", force: true

git add: '.'
git commit: "-m 'update base helper files'"