describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://localhost:44485/')
    cy.contains("reactcalendar")
    cy.contains("September 2023")
    cy.contains('chevron_right').click()
    cy.contains('October 2023')
  })
})