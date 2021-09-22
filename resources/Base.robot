*Settings*
Documentation    Aqui é onde tudo começa

Library    RequestsLibrary
Library    Helpers.py

Resource    routes/Characters.robot

*Variables*
${BASE_URL}    http://marvel.qaninja.academy

*Keywords*
Super Setup
    [Arguments]    ${email}

    Token Account              ${email}
    Limpar Tabela Character

Token Account
    [Arguments]    ${email}

    &{usuario}    Create Dictionary    email=${email}

    ${response}    POST    ${BASE_URL}/accounts    json=${usuario}

    ${client_key}    Set Variable         ${response.json()}[client_key]
    &{HEADERS}       Create Dictionary    client_key=${client_key}

    Set Suite Variable    ${HEADERS}

Limpar Tabela Character

    DELETE    ${BASE_URL}/delorean    headers=${HEADERS}

