describe('template spec', () => {
  it('page renders', () => {
    cy.visit('http://localhost:5000/')
    cy.contains("hello")
  })
})