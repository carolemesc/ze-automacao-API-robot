# automacao-API-robot
Teste de automação API usando o Robot Framework

# Configurando o ambiente para execução dos testes automatizados

Sistema Operacional utilizado: Windows
IDE utilizada: Visual Studio Code
Librarie utilizada: Collections Library, Requests Library e BuiltIn
Framework utilizado: Robot Framework

1º passo: instalação do Python
o Python é um pré requisito para usar o robot, para instalar as bibliotecas é necessário utilizar o "pip" (útil para instalar e gerenciar pacotes escritos em Python), além de ser possível criar novas novas bibliotecas utilizando, entre outras, essa linguagem.
- Acessar o link "https://www.python.org/downloads/"
- Clicar em "download Python V" (onde "V" é a última versão disponível do Python para Windows)
- Adicione o Pyhton ao path, nas variáveis do sistema acessando "Propriedades do Sistema" > "Variáveis de Ambiente" > "Path" > "Editar" > insira o caminho 	           de onde instalou o Python no Path
- Confira se o passo anterior foi feito de forma correta abrindo o cmd > "python --version" > (aparecerá a versão do python) > "pip --version" > (aparecerá a 	    versão do pip)


2º passo: instalação do Robot Framework

- Abra o cmd > "pip install robotframework" > (aguarde a instalação)
- Verifique se foi instalado de forma correta. Ainda no cmd > "pip freeze" > (listará todos os pacotes instalados pelo pip, veja se o robot está na lista


3º passo: instalando e configurando a IDE (Visual Studio Code)
- Acesse o link "https://code.visualstudio.com/Download" e faça o download para windows
- Para configurar o robot: abra o VS Code > "extensões" > "Robot Framework Language Server" da Robocorp > "install"
- Reinicie o VSCode para garantir a instalação
	

4º passo: instalando o web driver
para testar um sistema web utilizando o selenium, é necessário instalar um drive do browser utilizado, nesse caso, utilizei o Chrome	
- Acesse o link "https://chromedriver.chromium.org/downloads" -- se desejar usar o firefox, é necessário instalar o "Geckodriver"
- Busque pela release que suporte a versão do chrome usada na sua máquina
- (salvei e extraí o webdriver na pasta do "Scripts" python, apenas porque está mapeado nas variáveis do sistema)
	
	
# Como executar os testes

1º passo: para rodar os testes
- é importante certificar de que os arquivos (buscaAPI_variaveis.robot, buscaAPI_testes.robot e buscasAPI_resources.robot) estejam todos na mesma pasta
- pelo terminal do Visual Studio: abre o terminal na pasta do projeto e escreva o comando "robot buscaAPI_testes.robot"
- pelo cmd: acesse a pasta do projeto e escreva o mesmo comando que escrevera no terminal do VS code
	
	
2º passo: ver o log de execução dos testes
- executando o teste como falado no passo anterior, um arquivo "log" será criado na mesma pasta onde estão arquivos de teste. Para ver o resultado e detalhamento de execução você pode abrir esse arquivo com a web e visualizar a descrição dos comandos e do resultado da execução de cada um deles
	
	
# Framework, Libraries e IDE utilizadas

- Framework: Escolhi o RobotFramework, pois sei que é uma habilidade desejada no time de qualidade do Zé, além de ser a ferramenta que me sinto mais a vontade para trabalhar
	
- Libraries: 
Collections: A collections library é usada para poder extrair valores da lista do resultado do json, por exemplo, o resultado apresentado em "weather" é uma lista e é preciso extrair a informação da lista. 
RequestsLibrary: Fornece funcionalidades de testes de API
BuiltIn: Biblioteca padrão do Robot geralmente usadas para fazer verificações, conversões, retornar valores, etc.
	
- IDE: Escolhi o Visual Studio Code porque é um editor que gosto de trabalhar
