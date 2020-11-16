describe('Recipes page', () => {
    it('Goes to recipes page', () => {
        cy.visit('/')
        cy.contains('Recipes').click()
        cy.url().should('include', '/recipes')
    })
})
