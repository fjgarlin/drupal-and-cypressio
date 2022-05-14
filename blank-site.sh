#!/bin/bash

# Build site.
rm -rf blank/
mkdir blank
cd blank
echo "<h1>Homepage</h1><a href='about.html'>About</a>" > index.html
echo "<h1>About page</h1>" > about.html

# Launch server.
nohup php -S localhost:2022 &

# Install CypressIO and create first test.
echo "{}" > package.json
npm install cypress --save-dev
test="
describe('About page', () => {
    it('Goes to about page', () => {
        cy.visit('http://localhost:2022')
        //cy.visit('https://2022.drupalcamp.es')
        cy.contains('About').click()
        cy.url().should('include', '/about')
    })
})
"
mkdir cypress && mkdir cypress/integration
touch cypress/integration/first_test.js
echo "$test" > cypress/integration/first_test.js

read -p "Press [Enter] to resume ..."

npx cypress open

# Quit server
killall -9 php
