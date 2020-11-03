#!/bin/sh

# If a command fails then the deploy stops
set -e

# Print out commands before executing them
set -x

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project. zzo is the theme name
hugo -t zzo

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Back to the origin folder
# cd ..

# rm -rf public
