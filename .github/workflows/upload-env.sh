#/usr/bin/env bash

upload-env() {
    remote_url=$(git remote get-url origin)
    cd $1
    echo "/$1" >> ../.gitignore
    git init --initial-branch=env-$1
    git add .
    git config user.name PineAG
    git config user.email pein.agail@gmail.com
    git commit -m "Init docker-compose.yml for $1" --allow-empty
    git remote add origin $remote_url
    git push origin env-python
    cd ..
}

for e in $(cat .github/workflows/env-list.txt); do
    upload-env $e
done