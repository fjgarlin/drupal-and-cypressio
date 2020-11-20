#!/bin/bash

# https://www.drupal.org/docs/official_docs/en/_evaluator_guide.html
sudo rm -rf d8
mkdir d8
cd d8
curl -sSL https://www.drupal.org/download-latest/tar.gz | tar -xz --strip-components=1
# For specific version: https://ftp.drupal.org/files/projects/drupal-8.9.9.tar.gz

# Site install needs more than 128M
echo "
if (PHP_SAPI === 'cli') {
  ini_set('memory_limit', '512M');
}
" >> sites/default/default.settings.php

# Install CypressIO and create first test.
echo "{}" > package.json
echo '{
    "baseUrl": "http://localhost:8888"
}' > cypress.json
npm install cypress --save-dev

# Add tests from `assets` folder.
mkdir cypress && mkdir cypress/integration
cp ../assets/* cypress/integration/

# Launch server.
# php -d memory_limit=512M composer require drush/drush:^9
drush -y si demo_umami --db-url=sqlite://sites/default/files/.ht.sqlite --account-pass=admin
nohup php -S localhost:8888 &
PHP_SERVER_PID=$!

npx cypress open

# Quit server.
kill -9 $PHP_SERVER_PID