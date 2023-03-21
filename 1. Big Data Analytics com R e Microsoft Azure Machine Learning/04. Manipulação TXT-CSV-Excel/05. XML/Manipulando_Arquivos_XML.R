# Manipulação de Arquivos XML

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Instala o pacote
install.packages("XML")

# Carrega o pacote
library("XML")

# Pacote necessário para manipular o conteúdo xml
library("methods")

# Carrega o arquivo
resultado <- xmlParse(file = "funcionarios.xml")

# Visualiza
print(resultado)

# Extrai o nó raiz
rootnode <- xmlRoot(resultado)
print(rootnode[1])

# Número de nós no arquivo
rootsize <- xmlSize(rootnode)

# Visualiza
print(rootsize)

# Primeiro elemento do primeiro nó
print(rootnode[[1]][[1]])

# Quinto elemento do primeiro nó
print(rootnode[[1]][[5]])

# Segundo elemento do terceiro nó
print(rootnode[[3]][[2]])

# Carrega o arquivo xml como dataframe
xmldataframe <- xmlToDataFrame("funcionarios.xml")
print(xmldataframe)


