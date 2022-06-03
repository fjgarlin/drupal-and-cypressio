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
mkdir cypress && mkdir cypress/e2e
touch cypress/e2e/first_test.cy.js
echo "$test" > cypress/e2e/first_test.cy.js

read -p "Press [Enter] to resume ..."

npx cypress open
