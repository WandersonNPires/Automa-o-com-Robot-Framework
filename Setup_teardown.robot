
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Given that I access the organ
    Open Browser       url=http://localhost:3000       browser=Chrome

Close the browser
   Close Browser