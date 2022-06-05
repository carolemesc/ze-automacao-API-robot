*** Settings ***
Library          Collections
Library          RequestsLibrary
Library          XML
Resource         buscaAPI_variaveis.robot
Documentation    Através do código python "OpenWeather" (ou simplesmente pela chamada da API no browser), é possível ver o resultado json da requisição
...              {'coord': {'lon': -43.2075, 'lat': -22.9028},
...              'weather': [{'id': 701, 'main': 'Mist', 'description': 'mist', 'icon': '50n'}],
...              'base': 'stations',
...              'main': {'temp': 293.54, 'feels_like': 294.04, 'temp_min': 293.13, 'temp_max': 294.56, 'pressure': 1026, 'humidity': 92},
...              'visibility': 4000, 'wind': {'speed': 5.66, 'deg': 170},
...              'clouds': {'all': 100},
...              'dt': 1654304141,
...              'sys': {'type': 1, 'id': 8429, 'country': 'BR', 'sunrise': 1654248429, 'sunset': 1654287308},
...              'timezone': -10800, 'id': 3451190, 'name': 'Rio de Janeiro', 'cod': 200}

*** Keywords ***
Conectar na API
    Create Session           cidade            ${link}

Busca pela cidade
    ${resultado}=            GET On Session              cidade       ${parametro1}${parametro_cidade}${cidade}${graus}${api_key}${idioma}     #envia uma nova solicitação GET na solicitação anterior
    #https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API key}&units={units}&lang={idioma}
    Log                      Resultado em Json: ${resultado}
    Set Suite Variable       ${resultado}

Valida o resultado do response
    #200 --> requisição bem sucedida
    #400 --> reqisição não encontrada
    Should Be Equal As Strings        ${resultado.status_code}        200                  #.status_code é o codigo python usado para verificar o status da requisição
    Log    Status da requisição: ${resultado.status_code}                                  #registra a mensagem .status code, ou seja, registra a mensagem recebida com a requisição
    Log To Console    Status da requisição sucesso: 200

Informa as coordenadas
    ${lat}=              Get From Dictionary        ${resultado.json()["coord"]}         lat        #pega o paâmetro escolhido no resultado json
    Log To Console       latitude: ${lat}
    ${long}=             Get From Dictionary        ${resultado.json()["coord"]}         lon
    Log To Console       longitude: ${long}

Informa a descrição do tempo atual
    ${tempo}=            Get From Dictionary        ${resultado.json()["weather"][0]}    description
    Log To Console       Hoje o tempo está: ${tempo}

Informa a temperatura atual, máxima e mínima
    ${temp_atual}=        Get From Dictionary        ${resultado.json()["main"]}            temp
    Log To Console        A temperatura agora é de: ${temp_atual} ºC
    ${temp_max}=          Get From Dictionary        ${resultado.json()["main"]}            temp_max
    Log To Console        A máxima para hoje é: ${temp_max} ºC
    ${temp_min}=          Get From Dictionary        ${resultado.json()["main"]}            temp_min
    Log To Console        A mínima para hoje é: ${temp_min} ºC

Informa a umidade do ar
    ${umidade}=               Get From Dictionary    ${resultado.json()["main"]}            humidity
    Log To Console            A umidade do ar: ${umidade}

Valida o nome da cidade
    Dictionary Should Contain Item                   ${resultado.json()}        name        ${cidade}
    Log To Console            Cidade: ${cidade} 

Informa o país
    ${pais}=               Get From Dictionary       ${resultado.json()["sys"]}                country
    Log To Console         O país é: ${pais}
Busca pela latitude e longitude
    ${resultado}=            GET On Session           cidade       ${parametro1}${parametro_lat}${latitude}${parametro_lon}${longitude}${graus}${api_key}${idioma}     #envia uma nova solicitação GET na solicitação anterior
    #https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    Log                      Resultado em Json: ${resultado}
    Set Suite Variable       ${resultado}

Valida as coordenadas
    Log To Console            Json:${resultado.json()}
    Dictionary Should Contain Item                   ${resultado.json()["coord"]}        lon        ${longitude}
    Log To Console            Longitude: ${longitude} 
    Dictionary Should Contain Item                   ${resultado.json()["coord"]}        lat        ${latitude}
    Log To Console            Longitude: ${latitude} 

Informa o nome da cidade
    ${informa_cidade}=               Get From Dictionary    ${resultado.json()}                name
    Log To Console                   A cidade é: ${informa_cidade}