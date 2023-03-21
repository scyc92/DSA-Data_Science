# Manipulação de Arquivos Excel

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Instalando o pacote
install.packages("readxl")

# Pacote readxl
library(readxl)

# Lista as worksheet no arquivo Excel
excel_sheets("PopUrbana.xlsx")

# Lendo a planilha do Excel
read_excel("PopUrbana.xlsx")
View(read_excel("PopUrbana.xlsx"))
read_excel("PopUrbana.xlsx", sheet = "Period2")
read_excel("PopUrbana.xlsx", sheet = 3)
read_excel("PopUrbana.xlsx", sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel("PopUrbana.xlsx", sheet = 3)
View(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets("PopUrbana.xlsx"), read_excel, path = 'PopUrbana.xlsx')
class(df_todas)
View(df_todas)

