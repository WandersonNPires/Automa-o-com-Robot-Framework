*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${BOTAO_CARD}      id:form-botao 
@{selecionar_time}
...         //option[contains(.,'Programação')]
...         //option[contains(.,'Front-End')]
...         //option[contains(.,'Data Science')]
...         //option[contains(.,'Devops')]
...         //option[contains(.,'UX e Design')]
...         //option[contains(.,'Mobile')]
...         //option[contains(.,'Inovação')]
*** Keywords ***
Given that filling out the form fields
    ${Nome}=       FakerLibrary.First Name
    Input Text     ${CAMPO_NOME}       ${Nome}
    ${Cargo}=      FakerLibrary.Job    
    #Podemos notar que não obtivemos cargos condizentes com um time de Programação. Nesse caso, não conseguimos puxar cargos específicos da área de TI, mas o objetivo do teste era apenas autorizar o dado inserido dentro do campo.
    Input Text     ${CAMPO_CARGO}      ${Cargo}
    ${Imagem}=     FakerLibrary.Image Url    width=100    height=100
    Input Text     ${CAMPO_IMAGEM}     ${Imagem}
    Click Element  ${CAMPO_TIME}
    Click Element  ${selecionar_time}[0]
    Sleep          10s

And click on the create card button
    Click Element  ${BOTAO_CARD}

Then identify the card in the expected team
    Element Should Be Visible  class:colaborador
    Sleep                       5s

Then identify tree card in the expected team
    FOR    ${I}    IN RANGE    1    3
        Given that filling out the form fields
        And click on the create card button
    END
    Sleep    10s

Then create and identify card for each team available
    FOR    ${indice}    ${Time}    IN ENUMERATE    @{selecionar_time}
        Given that filling out the form fields
        Click Element     ${Time}
        And click on the create card button

    END
    Sleep    10s

    
Given that I click on the create card button
    Click Element	${BOTAO_CARD}         

Then the system displays a mandatory field message
    Element Should Be Visible	id:form-nome-erro
    Element Should Be Visible	id:form-cargo-erro
    Element should be visible	id:form-times-erro
    Sleep    10s