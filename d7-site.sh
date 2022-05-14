#!/bin/bash

sudo rm -rf d7
# https://www.drupal.org/forum/support/installing-drupal/2020-06-14/using-composer-to-install-drupal-7#comment-13698390
composer create-project drupal-composer/drupal-project:7.x-dev d7
cd d7

# Install CypressIO and create first test.
echo "{}" > package.json
npm install cypress --save-dev
test="
describe('Register page', () => {
    it('Registers a new user', () => {
        cy.visit('http://localhost:7777')
        cy.contains('Create new account').click()
        cy.url().should('include', '/register')
        cy.get('input[name=name]').type('Fran Garcia')
        cy.get('input[name=mail]').type('fjgarlin@gmail.com{enter}')
        cy.contains('Thank you').should('be.visible')
    })
})
"
mkdir cypress && mkdir cypress/integration
touch cypress/integration/user_register.js
echo "$test" > cypress/integration/user_register.js

# Launch server.
./vendor/bin/drush -y si standard --db-url=sqlite://sites/default/files/.ht.sqlite --account-pass=admin
nohup php -S localhost:7777 -t web &

read -p "Press [Enter] to resume ..."

npx cypress open

# Quit server.
killall -9 php
