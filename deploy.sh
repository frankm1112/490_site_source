#!/bin/zsh

# This should be run from the source code directory, not from public

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Commit changes to source code
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi




# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# echo -n "Please enter the commit message:"
# read msg
# echo "Your message was $msg"

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master 

# Go back up to the original directory
cd ..
