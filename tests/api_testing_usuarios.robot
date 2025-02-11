*** Settings ***
Resource  ../resources/api_testing_usuarios.resource


*** Test Cases ***


Cenario 01: Cadastrar um novo usuario com sucesso na ServeRest
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest  email=${EMAIL_TESTE}  status_code_esperado=201
    Conferir se o usuario foi cadastrado corretamente

Cenario 02: Cadastrar um usuario ja existente
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest  email=${EMAIL_TESTE}  status_code_esperado=201
    Vou repetir o cadastro do usuario
    Verificar se a API nao permitiu o cadastro repetido

Cenario 03: Consultar os dados de um novo usuario
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest  email=${EMAIL_TESTE}  status_code_esperado=201
    Consultar os dados do novo usuario
    Conferir os dados retornados

Cenário 04: Logar com o novo usuário criado
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest  email=${EMAIL_TESTE}  status_code_esperado=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso  