#/usr/bin/env bash
gh_token=$1

upload-env() {
    echo "/$1" >> .gitignore
    cd $1
    git init --initial-branch=env-$1
    git add .
    git config user.name PineAG
    git config user.email pein.agail@gmail.com
    git commit -m "Init docker-compose.yml for $1" --allow-empty
    git remote add origin "https://x-access-token:$gh_token@github.com/PineAG/awesome-docker-compose.git"
    git push origin env-$1
    cd ..
}

for e in $(cat .github/workflows/env-list.txt); do
    upload-env $e
done