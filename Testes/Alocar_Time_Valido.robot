*** Settings ***
Resource       ../Resources/main.robot
Test Setup     Given that I access the organ
Test Teardown  Close Browser



*** Test Cases ***
Check that when filling out the form correctly, the data was entered into the list and that the new card was created at the expected time
    Given that filling out the form fields
    And click on the create card button
    Then identify the card in the expected team

Check that possible create more card if fill out the form correctly
    Given that filling out the form fields
    And click on the create card button
    Then identify tree card in the expected team

Check if it is possible to create a card for each team if we fill in the fields correctly
    Given that filling out the form fields
    Then create and identify card for each team available
