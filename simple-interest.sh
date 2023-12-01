#!/bin/bash

# GitHub Repository details
repo_owner="Lelisayohanes"
repo_name="new-repository"
base_branch="main"
new_branch="new-branch"

# Your GitHub Personal Access Token
access_token="YOUR_ACCESS_TOKEN"

# Fork the repository
fork_response=$(curl -X POST -H "Authorization: token $access_token" \
  "https://api.github.com/repos/$repo_owner/$repo_name/forks")

# Get the forked repository URL
forked_repo_url=$(echo "$fork_response" | jq -r .clone_url)

# Clone the forked repository
git clone "$forked_repo_url"

# Navigate to the cloned repository
cd "$repo_name"

# Create a new branch
git checkout -b "$new_branch"

# Push the new branch to the forked repository
git push origin "$new_branch"
