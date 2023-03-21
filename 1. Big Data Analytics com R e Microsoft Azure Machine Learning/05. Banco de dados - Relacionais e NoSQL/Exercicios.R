# Lista de Exercícios e soluções

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap06")
getwd()


# Exercicio 1 - Instale e carregue os pacotes necessários para trabalhar com SQLite e R
install.packages(c("dbplyr", "RSQLite"))
library(RSQLite)
library(dbplyr)
library(dplyr)


# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
mamiferos <- dbConnect(SQLite(), "mamiferos.sqlite")


# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
?src_dbi
src_dbi(mamiferos)


# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objeto em R:
# SELECT year, species_id, plot_id FROM surveys
?tbl
dados <- tbl(mamiferos, sql("SELECT year, species_id, plot_id FROM surveys"))


# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)


# Exercicio 6 - Já carregamos a tabela abaixo para você. 
# Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(mamiferos, "surveys")

pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)


# Exercicio 7 - Grave o resultado do item anterior em um objeto R. 
# O objeto final deve ser um dataframe
dados2 <- pesquisas %>% 
  filter(weight < 5) %>%
  select(species_id, sex, weight)

class(dados2)
dados3 <- as.data.frame(dados2)
class(dados3)
View(dados3)


# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(mamiferos)


# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(mamiferos, "dados3", dados3)
dbRemoveTable(mamiferos, "dados3")
dbListTables(mamiferos)


# Exercicio 10 - Imprima os dados da tabela criada no item anterior
dbReadTable(mamiferos, "dados3")



