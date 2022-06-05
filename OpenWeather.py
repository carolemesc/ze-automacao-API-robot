
import requests


API_key = "c5f15e330ebe916d7b7997334c2a0930"
cidade = "Rio de Janeiro"
link = f"https://api.openweathermap.org/data/2.5/weather?q={cidade}&appid={API_key}&len=pt_br"

requisicao = requests.get(link)
print(requisicao, "se der 200 passou")
requisicao_dic = requisicao.json()
print(requisicao_dic)
descricao = requisicao_dic['weather'][0]['description']             #"weather" é uma lista com um único ítem (lista começa a contar em 0)
temperatura = requisicao_dic['main']['temp'] - 273.15
print(descricao,temperatura,"ºC")


# {'coord': {'lon': -43.2075, 'lat': -22.9028},
# 'weather': [{'id': 701, 'main': 'Mist', 'description': 'mist', 'icon': '50n'}],
# 'base': 'stations',
# 'main': {'temp': 293.54, 'feels_like': 294.04, 'temp_min': 293.13, 'temp_max': 294.56, 'pressure': 1026, 'humidity': 92},
# 'visibility': 4000, 'wind': {'speed': 5.66, 'deg': 170},
# 'clouds': {'all': 100},
# 'dt': 1654304141,
# 'sys': {'type': 1, 'id': 8429, 'country': 'BR', 'sunrise': 1654248429, 'sunset': 1654287308},
# 'timezone': -10800, 'id': 3451190, 'name': 'Rio de Janeiro', 'cod': 200}


