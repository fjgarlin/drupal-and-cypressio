#!/bin/bash

rm -rf drupalcamp/
mkdir drupalcamp
cd drupalcamp

# Install CypressIO and create first test.
echo "{}" > package.json
npm install cypress --save-dev
test="
describe('Programa', () => {
    it('Va al programa', () => {
        cy.visit('https://2022.drupalcamp.es')
        cy.get('footer').scrollIntoView()
        cy.contains('Programa').click()
        cy.url().should('include', '/programa')
        cy.contains('Testing con Cypress')
    })
})
"
mkdir cypress && mkdir cypress/integration
touch cypress/integration/first_test.js
echo "$test" > cypress/integration/first_test.js

read -p "Press [Enter] to resume ..."

npx cypress open
