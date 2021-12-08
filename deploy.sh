#!/usr/bin/env sh
set -e

npm run build

cd dist

git init 
git add -A
git commit -m "Deploy Multimedia"
git push -f git@github.com:Surendra6/multimedia.git master:gh-pages

cd -