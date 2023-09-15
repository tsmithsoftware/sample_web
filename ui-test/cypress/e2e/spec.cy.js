describe('template spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:3000/')
    cy.contains("reactcalendar")
    cy.contains('chevron_right').click()
    cy.contains('October 2023')
  })
})