*** settings***
Resource     ../Resources/main.robot
Test Setup     Given that I access the organ
Test Teardown     Close Browser


*** Variables ***
${BOTAO_CARD}             id:form-botao


***Test Cases***
Verifica se o campo obrigatorio não for preenchido
    Given that I click on the create card button
    Then the system displays a mandatory field message