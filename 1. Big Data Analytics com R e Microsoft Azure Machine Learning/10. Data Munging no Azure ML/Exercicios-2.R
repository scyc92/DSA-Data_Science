# Lista de Exercícios e solução

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap14")
getwd()


# Para este exemplo, usaremos o dataset Titanic do Kaggle. 
# Este dataset é famoso e usamos parte dele nas aulas de SQL.
# Ele normalmente é usado por aqueles que estão começando em Machine Learning.

# Vamos prever uma classificação - sobreviventes e não sobreviventes

# https://www.kaggle.com/c/titanic/data


# Comecamos carregando o dataset de dados_treino
dados_treino <- read.csv('datasets/titanic-train.csv')
View(dados_treino)

# Analise exploratória de dados
# Vamos usar o pacote Amelia e suas funções para definir o volume de dados Missing
# Clique no zoom para visualizar o grafico
# Cerca de 20% dos dados sobre idade estão Missing (faltando)
install.packages("Amelia")
library(Amelia)

?missmap
missmap(dados_treino, 
        main = "Titanic Training Data - Mapa de Dados Missing", 
        col = c("yellow", "black"), 
        legend = FALSE)

# Visualizando os dados
library(ggplot2)
ggplot(dados_treino,aes(Survived)) + geom_bar()
ggplot(dados_treino,aes(Pclass)) + geom_bar(aes(fill = factor(Pclass)), alpha = 0.5)
ggplot(dados_treino,aes(Sex)) + geom_bar(aes(fill = factor(Sex)), alpha = 0.5)
ggplot(dados_treino,aes(Age)) + geom_histogram(fill = 'blue', bins = 20, alpha = 0.5)
ggplot(dados_treino,aes(SibSp)) + geom_bar(fill = 'red', alpha = 0.5)
ggplot(dados_treino,aes(Fare)) + geom_histogram(fill = 'green', color = 'black', alpha = 0.5)

# Limpando os dados
# Para tratar os dados missing, usaremos o recurso de imputation.
# Essa técnica visa substituir os valores missing por outros valores,
# que podem ser a média da variável ou qualquer outro valor escolhido pelo Cientista de Dados

# Por exemplo, vamos verificar as idades por classe de passageiro (baixa, média, alta):
pl <- ggplot(dados_treino, aes(Pclass,Age)) + geom_boxplot(aes(group = Pclass, fill = factor(Pclass), alpha = 0.4)) 
pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2))

# Vimos que os passageiros mais ricos, nas classes mais altas, tendem a ser mais velhos. 
# Usaremos esta média para imputar as idades Missing
impute_age <- function(age, class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

fixed.ages <- impute_age(dados_treino$Age, dados_treino$Pclass)
dados_treino$Age <- fixed.ages

# Visualizando o mapa de valores missing (nao existem mais dados missing)
missmap(dados_treino, 
        main = "Titanic Training Data - Mapa de Dados Missing", 
        col = c("yellow", "black"), 
        legend = FALSE)


# Exercício 1 - Construindo o Modelo

# Primeiro, uma limpeza nos dados
str(dados_treino)
head(dados_treino, 3)
library(dplyr)
dados_treino <- select(dados_treino, -PassengerId, -Name, -Ticket, -Cabin)
head(dados_treino, 3)
str(dados_treino)

# Treine o modelo e depois faça as previsões
log.model <- glm(formula = Survived ~ . , family = binomial(link = 'logit'), data = dados_treino)

# Podemos ver que as variáveis Sex, Age e Pclass sao as variaveis mais significantes
summary(log.model)

# Fazendo as previsoes nos dados de teste
library(caTools)
set.seed(101)

# Split dos dados
split = sample.split(dados_treino$Survived, SplitRatio = 0.70)

# Datasets de treino e de teste
dados_treino_final = subset(dados_treino, split == TRUE)
dados_teste_final = subset(dados_treino, split == FALSE)

# Gerando o modelo com a versão final do dataset
final.log.model <- glm(formula = Survived ~ . , family = binomial(link='logit'), data = dados_treino_final)

# Resumo
summary(final.log.model)

# Prevendo a acurácia
fitted.probabilities <- predict(final.log.model, newdata = dados_teste_final, type = 'response')

# Calculando os valores
fitted.results <- ifelse(fitted.probabilities > 0.5, 1, 0)

# Conseguimos quase 80% de acurácia
misClasificError <- mean(fitted.results != dados_teste_final$Survived)
print(paste('Acuracia', 1-misClasificError))

# Criando a confusion matrix
table(dados_teste_final$Survived, fitted.probabilities > 0.5)










