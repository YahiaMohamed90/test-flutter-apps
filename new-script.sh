#!/bin/bash

# Check if there are local changes that would be overwritten by merge
if git diff --quiet; then
    echo "No local changes. Pulling changes..."
    git pull origin dev
else
    # If there are local changes, find the conflicting files
    conflicting_files=$(git diff --name-only)
    
    echo "Local changes detected in the following files:"
    echo "$conflicting_files"
    
    # Remove conflicting files and pull again
    echo "Removing conflicting files and pulling again..."
    git reset --hard HEAD
    git pull origin dev
fi
