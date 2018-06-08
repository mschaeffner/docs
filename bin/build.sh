#!/bin/sh

# print commands on screen
set -x

rm -rf content/api
rm -rf content/cli
rm -rf content/files
rm -rf content/misc

rm -rf content/policies

# Download the source of the latest release of npm.
# The local git repository will be used in tree.js
# to figure out the last modified date of documentation files.
NPM_VERSION=`npm view npm version`
git clone --branch v${NPM_VERSION} git@github.com:npm/npm.git npm-source

cp -r npm-source/doc/cli content/
cp -r npm-source/doc/files content/
cp -r npm-source/doc/misc content/
rm -f content/misc/npm-index.md

./bin/tree.js

# Remove the git repository that was cloned above.
rm -rf npm-source
