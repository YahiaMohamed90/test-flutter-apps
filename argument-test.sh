#!/bin/bash

# Define the default valuessssss
default_branch_name="main"
default_env_file=".env"
default_project_name="Ghaith-Dev"

# Get the branch name from the command line argument
branch_name="$1"

# Check the branch name and update values accordingly
if [[ $branch_name == "dev" ]]; then
    # If the branch name is "dev", update the values accordingly
    git pull origin dev
    rm 'test/.env'
    cp '.env.development' 'test/.env'
    project_name="Ghaith-Dev"
elif [[ $branch_name == "staging" ]]; then
    # If the branch name is "staging", update the values accordingly
    git pull origin main
    rm 'test/.env'
    cp '.env.staging' 'test/.env'
    project_name="Ghaith-Staging"
else
    # For any other branch name, use the default values
    git pull origin "$default_branch_name"
    rm 'test/.env'
    cp '.env.development' "test/$default_env_file"
    project_name="$default_project_name"
fi

# Return the project name
echo "$project_name"

