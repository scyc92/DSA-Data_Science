# Manipulação de Arquivos JSON

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Instala o pacote
install.packages("rjson")

# Carrega o pacote
library("rjson")

# Carrega o arquivo
resultado <- fromJSON(file = "funcionarios.json")

# Visualiza
print(resultado)

# Carrega como dataframe
json_data_frame <- as.data.frame(resultado)

# Visualiza
print(json_data_frame)