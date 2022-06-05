*** Settings ***
Resource        buscaAPI_resources.robot
Resource        buscaAPI_variaveis.robot
Library         Collections
Library         RequestsLibrary
Test Setup      Conectar na API

*** Test Cases ***

Caso de teste 01: faz uma busca por uma cidade válida
    Busca pela cidade
    Valida o resultado do response                                    #200 OK e 404 não encontrado
    Informa as coordenadas
    Informa a descrição do tempo atual
    Informa a temperatura atual, máxima e mínima
    Informa a umidade do ar
    Valida o nome da cidade
    Informa o país


Caso de teste 02: faz uma busca por latitude e longitude
    Busca pela latitude e longitude
    Valida o resultado do response                                    #200 OK e 404 não encontrado
    Valida as coordenadas
    Informa a descrição do tempo atual
    Informa a temperatura atual, máxima e mínima
    Informa a umidade do ar
    Informa o nome da cidade
    Informa o país