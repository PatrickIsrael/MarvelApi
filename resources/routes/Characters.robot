*Settings*
Documentation    Ações da Rota /Characters

*Keywords*
Post New Character
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${BASE_URL}/characters
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}

GET Character By Id
    [Arguments]    ${character}

    ${response}    GET
    ...            ${BASE_URL}/characters/${character}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}

DELETE Character By Id
    [Arguments]    ${character}

    ${response}    DELETE
    ...            ${BASE_URL}/characters/${character}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [Return]    ${response}