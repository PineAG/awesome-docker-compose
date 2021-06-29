#/usr/bin/env bash

upload-env() {
    echo "/$1" >> .gitignore
    cd $1
    git init --initial-branch=env-$1
    git add .
    git config user.name ${{ secrets.GH_USER }}
    git config user.email "${{ secrets.GH_MAIL }}"
    git commit -m "Init docker-compose.yml for $1" --allow-empty
    git remote add origin "https://${{ secrets.GH_TOKEN}}@github.com/PineAG/awesome-docker-compose.git"
    git push origin env-$1
    cd ..
}

for e in $(cat .github/workflows/env-list.txt); do
    upload-env $e
done