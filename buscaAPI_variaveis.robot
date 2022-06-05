*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    XML
Documentation        Para realizar os testes altere as seguintes variáveis: ${cidade}, ${latitude}, ${longitude}.
...                  A cidade e a latitude/longitude podem ser de locais diferentes

*** Variables ***
${link}                    https://api.openweathermap.org/data/2.5/
${parametro1}              weather?
${parametro_cidade}        q=
${cidade}                  São Paulo
${parametro_lat}           &lat=
${latitude}                -15.7801
${parametro_lon}           &lon=
${longitude}               -47.9292
${api_key}                 &appid=c5f15e330ebe916d7b7997334c2a0930
${graus}                   &units=metric
${idioma}                  &lang=pt_br
${formato}                 &mode=xml
