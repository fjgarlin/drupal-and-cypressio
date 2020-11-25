#!/bin/bash

sudo rm -rf d7
mkdir d7
cd d7
git clone https://github.com/amazeeio/drupal7-example.git .

# Launch server.
# pygmy up
docker-compose up -d
docker-compose exec cli drush -y si

# Install CypressIO and create first test.
echo "{}" > package.json
npm install cypress --save-dev
test="
describe('Register page', () => {
    it('Registers a new user', () => {
        cy.visit('http://drupal7-example.docker.amazee.io')
        cy.contains('Create new account').click()
        cy.url().should('include', '/register')
        cy.get('input[name=name]').type('Fran Garcia')
        cy.get('input[name=mail]').type('fran.garcia@amazeelabs.com{enter}')
        cy.contains('Thank you').should('be.visible')
    })
})
"
mkdir cypress && mkdir cypress/integration
touch cypress/integration/user_register.js
echo "$test" > cypress/integration/user_register.js

npx cypress open

# Quit server
docker-compose stop
docker-compose down
