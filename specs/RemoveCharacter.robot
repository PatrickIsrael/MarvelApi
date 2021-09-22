*Settings*
Documentation    Suite de teste de exclusão de personagens na api da marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/massaJson.py

#Dado que o token tenha sido gerado
Suite Setup    Super Setup    patrickisrael@delete.com

*Test Cases*
Deve remover um personagem por id
    [Tags]    Fluxo_Principal

   #Dado que exista um personagem cadastrado
    ${personagem}    Bakugo
    ${bakugo}        Post New Character    ${personagem}
    ${bakugo_id}     Set Variable          ${bakugo.json()}[_id]

    #Quando é solicitado que o personagem seja apagado
    ${response}    DELETE Character By Id    ${bakugo_id} 

    #Então é retornado o status 204
    Status Should Be    204    ${response}

    #Quando o personagem excluido é consultado pelo ID
    ${response}    GET Character By Id    ${bakugo_id} 

    #Então é retornado o status 404
    Status Should Be    404    ${response}
Não deve remover o personagem pelo Id
    [Tags]              Validacao 
    #Dado que o seguinte personagem não exista no banco de dados
    ${personagem_id}    Get Unique Id

    #Quando é solicitado que um personagem que não existe na base seja apagado
    ${response}    DELETE Character By Id    ${personagem_id} 

    #Então é retornado o status 404
    Status Should Be    404    ${response}