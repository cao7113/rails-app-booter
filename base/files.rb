def source_paths
  [__dir__]
end

template "Taskfile.yml", "Taskfile.yml", force: true
template "Dockerfile", "Dockerfile", force: true
copy_file ".dockerignore", ".dockerignore", force: true
copy_file "docker-compose.yml", "docker-compose.yml", force: true

git add: '.'
git commit: "-m 'update base helper files'"