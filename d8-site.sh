#!/bin/bash

# https://www.drupal.org/docs/official_docs/en/_evaluator_guide.html
sudo rm -rf d8
mkdir d8
cd d8
curl -sSL https://www.drupal.org/download-latest/tar.gz | tar -xz --strip-components=1

# Launch server.
nohup php core/scripts/drupal quick-start demo_umami &
PHP_SERVER_PID=$!

# Install CypressIO and create first test.
echo "{}" > package.json
echo '{
    "baseUrl": "http://127.0.0.1:8888"
}' > cypress.json
npm install cypress --save-dev

# Add tests from `assets` folder.
mkdir cypress && mkdir cypress/integration
cp ../assets/* cypress/integration/

npx cypress open



# Quit server
kill -9 $PHP_SERVER_PID

