///<reference types="cypress" /> 
//^Helps our code editor see that we use cypress just to help with autocompletion for commands

//Describe is used to order related tests together. We can think of it like a folder
//Here we could separate homepage tests from other tests, like login tests, for example
describe("Initial Homepage Tests", () => {
    // it('Does not do much!', () => {
    //     expect(true).to.equal(true)
    //   })
    it ('Clicks the "Login" view on the first page and checks if the URL is correct',()=> {
        cy.visit('http://localhost:3000')
        cy.get('[id^=SignIn]').click() //cy.get(selector, this chooses the element that has an id starting with "SignIn)
        cy.url().should('include','/login')})
})