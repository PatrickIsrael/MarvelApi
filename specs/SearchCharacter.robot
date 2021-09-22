*Settings*
Documentation    Suite de teste de busca de personagens na api da marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/massaJson.py

#Dado que o token tenha sido gerado
Suite Setup    Super Setup    patrickisrael@msn.com

*Test Cases*
Deve buscar um personagem por id
    [Tags]    Fluxo_Principal

   #Dado que exista um personagem cadastrado
    ${personagem}    King Archer
    ${Archer}        Post New Character    ${personagem}
    ${Archer_id}     Set Variable          ${Archer.json()}[_id]

    #Quando o personagem é consultado pelo ID
    ${response}    GET Character By Id    ${Archer_id} 

    #Então é retornado o status 200
    Status Should Be    200                          ${response}
    Should Be Equal     ${Archer.json()}[name]       ${personagem}[name]
    Should Be Equal     ${Archer.json()}[aliases]    ${personagem}[aliases]
    Should Be Equal     ${Archer.json()}[age]        ${personagem}[age]
    Should Be Equal     ${Archer.json()}[team]       ${personagem}[team]
    Should Be Equal     ${Archer.json()}[active]     ${personagem}[active]

Não deve encontrar o personagem pelo Id
    [Tags]              Validacao 
    #Dado que o seguinte personagem não exista no banco de dados
    ${personagem_id}    Get Unique Id
    #Quando o ID do persongem é consultado
    ${response}         GET Character By Id    ${personagem_id} 

    #Então é retornado o status 404
    Status Should Be    404    ${response}