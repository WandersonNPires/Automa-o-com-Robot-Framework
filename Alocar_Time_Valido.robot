*** Settings ***
Library  SeleniumLibrary
Resource    Setup_teardown.robot
Test Setup   Given that I access the organ
Test Teardown     Close Browser

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${BOTAO_CARD}      id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]

*** Test Cases ***
check that when filling out the form correctly, the data was entered into the list and that the new card was created at the expected time
      
      Given that filling out the form fields
      and click on the create card button
      Then identify the card in the expected team
   
 

*** Keywords ***
Given that filling out the form fields
    Input Text    ${CAMPO_NOME}   Junior
    Input Text    ${CAMPO_CARGO}   Desenvolvedor
    Input Text    ${CAMPO_IMAGEM}   https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${PROGRAMACAO}
    Sleep     10s
and click on the create card button
    Click Element    ${BOTAO_CARD}
Then identify the card in the expected team
...    Element Should Be Visible    class:colaborador
     Sleep     5s
