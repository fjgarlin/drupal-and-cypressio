describe('The Login Page', () => {
    it('Tests the login form', function () {
      cy.visit('/user/login')
      cy.get('input[name=name]').type('admin')
      cy.get('input[name=pass]').type('admin{enter}')

      cy.url().should('include', '/user/1')
      cy.get('h1').should('contain', 'admin')
    })
  })