#!/bin/bash

# REPO_URL https://github.com/VedKhairnar24/propeller-logo-update

# Step 1: Create React application
npx create-react-app propeller-logo-update
cd propeller-logo-update

# Step 2: Create initial commit and public GitHub repository
git add .
git commit -m "Initial commit: create React application"
gh repo create propeller-logo-update --public --source=. --remote=origin
git push -u origin master

# Step 3: Create and switch to update_logo branch
git switch -c update_logo

# Step 4: Replace existing logo with Propeller Aero logo
curl -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# Step 5: Replace existing link with DirtMate URL
sed -i 's|https://react.dev|https://www.propelleraero.com/dirtmate/|g' src/App.js

# Step 6: Commit and push changes
git add src/logo.svg src/App.js
git commit -m "Update logo and link to Propeller Aero DirtMate"
git push -u origin update_logo

# Step 7: Create pull request from update_logo to master
gh pr create --base master --head update_logo --title "Update logo and DirtMate link" --body "Replace the default React logo with the Propeller Aero logo and update the link to DirtMate."

# Step 8: Merge pull request using GitHub CLI
gh pr merge --merge
