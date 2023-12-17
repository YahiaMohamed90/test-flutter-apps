#!/bin/bash

# Define the conflicting file new sssssssssssssssssssssss
conflicting_file="README.md"

# Check if there are local changes to the conflicting file
if git diff --quiet "$conflicting_file"; then
    echo "No local changes to $conflicting_file. Pulling changes..."
    git pull origin dev
else
    # If there are local changes, remove the conflicting file and pull again
    echo "Local changes detected in $conflicting_file. Removing the file and pulling again..."
    rm "$conflicting_file"
    git pull origin dev
fi
