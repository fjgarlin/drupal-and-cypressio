describe('Changes language', () => {
    it('Ver las recetas', () => {
        cy.visit('/')
        cy.contains('Español').click()
        cy.url().should('include', '/es/')
        cy.contains('Recetas')
    })
})
