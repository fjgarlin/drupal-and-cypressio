#!/bin/bash

# https://www.drupal.org/docs/official_docs/en/_evaluator_guide.html
sudo rm -rf drupal_latest
composer create-project drupal/recommended-project drupal_latest
cd drupal_latest

# Site install needs more than 128M
composer require drush/drush
echo "
if (PHP_SAPI === 'cli') {
  ini_set('memory_limit', '512M');
}
" >> web/sites/default/default.settings.php

# Install CypressIO and create first test.
echo "{}" > package.json
echo 'const { defineConfig } = require("cypress")
module.exports = defineConfig({
  e2e: {
    baseUrl: "http://localhost:8888",
    supportFile: false
  }
})' > cypress.config.js
npm install cypress --save-dev

# Add tests from `assets` folder.
mkdir cypress && mkdir cypress/e2e
cp ../assets/* cypress/e2e/

# Launch server.
./vendor/bin/drush -y si demo_umami --db-url=sqlite://sites/default/files/.ht.sqlite --account-pass=admin
nohup php -S localhost:8888 -t web &

read -p "Press [Enter] to resume ..."

npx cypress open

# Quit server.
killall -9 php