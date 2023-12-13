#!/bin/bash

# Define the default values
default_branch_name="main"
default_env_file=".env"
default_project_name="Ghaith-Dev"

  branch_name=$1

  if [[ $branch_name == "dev" ]]; then
    # If the branch name is dev, update the values accordingly
    git pull  origin dev
    cp '.env.development' "$default_env_file"
    project_name="Ghaith-Dev"
  elif [[ $branch_name == "staging" ]]; then
    # If the branch name is staging, update the values accordingly
    git pull  origin main
    cp '.env.staging' "$default_env_file"
    project_name="Ghaith-Staging"
  else
    # For any other branch name, use the default values
    git pull  origin "$default_branch_name"
    cp '.env.development' "$default_env_file"
    project_name="$default_project_name"
  fi

  # Return the project name
  echo "$project_name"

cd test
rm '.env'

# Copy the appropriate environment file based on the branch name
cp "$default_env_file" '.env'

touch $project_name

