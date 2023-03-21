# Lab - MapReduce Para Análise de Dados com R e MongoDB 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap06")
getwd()

# Pacotes
library(ggplot2)
install.packages("devtools")
library("devtools")
install.packages("mongolite")
library(mongolite)

# Help
?mongolite

# Cria a conexão ao MongoDB
con <- mongo(collection = "airbnb",
             db = "dsadb",
             url = "mongodb://localhost",
             verbose = FALSE,
             options = ssl_options())

# Visualiza a conexão
print(con)

# Visualiza os dados
dados <- con$find()
View(dados)

# Verifica o número de registros no conjunto de dados
con$count('{}')

# Busca uma amostra de dados somente com propriedades do tipo House e as suas políticas de cancelamento
amostra1 <- con$find(
  query = '{"property_type" : "House" }', 
  fields = '{"property_type" : true, "cancellation_policy" : true}'
)
View(amostra1)

# Não queremos o campo de id
amostra2 <- con$find(
  query = '{"property_type" : "House" }', 
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id": false}'
)
View(amostra2)

# Vamos ordenar o resultado
amostra3 <- con$find(
  query = '{"property_type" : "House" }', 
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id": false}',
  sort = '{"cancellation_policy": -1}'
)
View(amostra3)

# Vamos agregar os dados e retornar a média de reviews (avaliações) por tipo de propriedade
amostra4 <- con$aggregate(
  '[{"$group":{"_id":"$property_type", "count": {"$sum":1}, "average":{"$avg":"$number_of_reviews"}}}]',
  options = '{"allowDiskUse":true}'
)
names(amostra4) <- c("tipo_propriedade", "contagem", "media_reviews")
View(amostra4)

# Vamos colocar o resultado em um gráfico
ggplot(aes(tipo_propriedade, contagem), data = amostra4) + geom_col()

# MapReduce - Mapeamento e Redução

# Contagem do número de reviews considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews), 1)}", 
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Contagem do número de reviews por faixa considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews/100)*100, 1)}", 
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Contagem do número de quartos considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.bedrooms), 1)}", 
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_quartos", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_quartos, contagem), data = resultado) + geom_col()














