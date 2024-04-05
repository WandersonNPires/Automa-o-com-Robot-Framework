*** settings***
library    seleniumLibrary
Resource     Setup_teardown.robot
Test Setup     Given that I access the organ
Test Teardown     Close Browser


*** Variables ***
${BOTAO_CARD}             id:form-botao


***Test Cases***
Verifica se o campo obrigatorio não for preenchido
    Given that I click on the create card button
    Then the system displays a mandatory field message


***Keywords***
Given that I click on the create card button
    Click Element	${BOTAO_CARD}         

Then the system displays a mandatory field message
    Element Should Be Visible	id:form-nome-erro
    Element Should Be Visible	id:form-cargo-erro
    Element should be visible	id:form-times-erro
    Sleep    10s