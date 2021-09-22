*Settings*
Documentation    Suite de teste de cadastro de personagens na api da marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/massaJson.py

#Dado que o token tenha sido gerado
Suite Setup    Super Setup    patrickisrael@gmail.com

*Test Cases*
Deve cadastrar um personagem
    [Tags]    Fluxo_Principal

    #Quando um personagem é cadastrastrado
    ${personagem}    King Mage
    ${response}      Post New Character    ${personagem}

    #Então é retornando o status 200
    Status Should Be    200    ${response}

Não deve cadastrar personagem com nome já existente
    [Tags]    Validacao    RN_01

   #Dado que o pesonagem já esteja cadastrado
    ${personagem}         Yuki
    Post New Character    ${personagem}

    #Quando o mesmo personagem é cadastrado novamente
    ${response}    Post New Character    ${personagem}

    #Então é retornando o status 409
    Status Should Be    409    ${response}

    #E é retornado a resposta "Character already exists :("
    Should Be Equal    ${response.json()}[error]    Character already exists :(