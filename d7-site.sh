#!/bin/bash

sudo rm -rf d7
mkdir d7
cd d7
curl -sSL https://ftp.drupal.org/files/projects/drupal-7.73.tar.gz | tar -xz --strip-components=1

# Launch server.
# nohup php core/scripts/drupal quick-start demo_umami &
# PHP_SERVER_PID=$!

# # Install CypressIO and create first test.
# echo "{}" > package.json
# npm install cypress --save-dev
# test="
# describe('About page', () => {
#     it('Goes to about page', () => {
#         cy.visit('http://localhost:2020')
#         //cy.visit('https://events.drupal.org/europe2020')
#         cy.contains('About').click()
#         cy.url().should('include', '/about')
#     })
# })
# "
# mkdir cypress && mkdir cypress/integration
# touch cypress/integration/first_test.js
# echo "$test" > cypress/integration/first_test.js

# npx cypress open

# # Quit server
# kill -9 $PHP_SERVER_PID
