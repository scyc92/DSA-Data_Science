# Carregando e Manipulando Arquivos TXT - Parte  1

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Usando as funções base do R (pacote utils)
search()


# Importando arquivo com read.table()
?read.table

df1 <- read.table("jogadores.txt")
df1
dim(df1)

df1 <- read.table("jogadores.txt", 
                  header = TRUE, 
                  sep = ',')
df1
dim(df1)

df1 <- read.table("jogadores.txt", 
                  header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"))
df1

df1 <- read.table("jogadores.txt", 
                  header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Tulio', 'Romario'))
df1

str(df1)

df1 <- read.table("jogadores.txt", header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = TRUE)
df1

str(df1)



# Importando arquivo com read.csv()
df2 <- read.csv("jogadores.txt")
df2
dim(df2)

df3 <- read.csv2("jogadores.txt")
df3
dim(df3)

df3 <- read.csv2("jogadores.txt", sep = ',')
df3
dim(df3)


# Importando arquivo com read.delim()
df4 <- read.delim("jogadores.txt")
df4
dim(df4)

df4 <- read.delim("jogadores.txt", sep = ',')
df4
dim(df4)

