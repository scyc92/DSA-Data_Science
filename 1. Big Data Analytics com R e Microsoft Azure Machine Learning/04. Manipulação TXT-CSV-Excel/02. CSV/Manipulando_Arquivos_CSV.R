# Trabalhando com arquivos csv 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Usando o pacote readr 
install.packages("readr")
library(readr)

search()

# Exportando o dataset e gerando o arquivo
?write_csv
write_csv(iris, "iris.csv")
dir()

# Tipos de dados
# col_integer(): 
# col_double(): 
# col_logical(): 
# col_character(): 
# col_factor(): 
# col_skip(): 
# col_date() (alias = “D”), col_datetime() (alias = “T”), col_time() (“t”) 

# Carregando o arquivo
?read_csv
df_iris <- read_csv("iris.csv", 
                    col_types = list(
                      Sepal.Length = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Length = col_double(),
                      Petal.Width = col_double(),
                      Species = col_factor(c("setosa", "versicolor", "virginica"))
))

View(df_iris)
dim(df_iris)
str(df_iris)


# Usando o pacote utils 
df_iris2 <- read.csv("iris.csv")
View(df_iris2)
dim(df_iris2)
str(df_iris2)

df_iris2 <- read.csv("iris.csv", stringsAsFactors = TRUE)
dim(df_iris2)
str(df_iris2)


# Gerando mais um arquivo csv
write_csv(mtcars, 'mtcars.csv')
dir()


# Carregando e Manipulando Vários Arquivos CSV Simultaneamente
list.files()
lista_arquivos <- list.files(getwd(), full.names = TRUE, pattern  = "*.csv")
lista_arquivos

# Loop para carregar cada arquivo e gerar uma lista
lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)



