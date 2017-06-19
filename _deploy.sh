#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 1
[ "${TRAVIS_BRANCH}" != "master" ] && exit 2

git config --global user.email "jtbates@gmail.com"
git config --global user.name "Jordan T. Bates"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
