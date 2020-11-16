describe('Changes language', () => {
    it('Ver las recetas', () => {
        cy.visit('/')
        cy.contains('Español').click()
        cy.contains('Recetas').click()
        cy.url().should('include', '/es/')
        cy.contains('Crema catalana').should('be.visible')
    })
})
