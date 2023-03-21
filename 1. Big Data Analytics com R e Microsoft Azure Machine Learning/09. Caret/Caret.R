# Usando o Pacote Caret Para Criar Modelos de Machine Learning em R
# http://topepo.github.io/caret/index.html

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap12")
getwd()

# Instalando os pacotes
install.packages("caret")
install.packages("randomForest")

# Carregando os pacotes
library(caret)
library(randomForest)
library(datasets)

# Usando o dataset mtcars
View(mtcars)

# Funcao do Caret para divisao dos dados
?createDataPartition
split <- createDataPartition(y = mtcars$mpg, p = 0.7, list = FALSE)

# Criando dados de treino e de teste
dados_treino <- mtcars[split,]
dados_teste <- mtcars[-split,]

# Treinando o modelo
?train
names(getModelInfo())

# Mostrando a importância das variáveis para a criação do modelo
?varImp

modelol_v1 <- train(mpg ~ ., data = dados_treino, method = "lm")
varImp(modelol_v1)

# Regressão linear
modelol_v1 <- train(mpg ~ wt + hp + qsec + drat, data = dados_treino, method = "lm")

# Random forest
modelol_v2 <- train(mpg ~ wt + hp + qsec + drat, data = dados_treino, method = "rf")

# Resumo do modelo
summary(modelol_v1)
summary(modelol_v2)

# Ajustando o modelo
?expand.grid
?trainControl
controle1 <- trainControl(method = "cv", number = 10)

modelol_v3 <- train(mpg ~ wt + hp + qsec + drat, 
                    data = dados_treino, 
                    method = "lm", 
                    trControl = controle1, 
                    metric = "Rsquared")

# Resumo do modelo
summary(modelol_v3)

# Coletando os residuos
residuals <- resid(modelol_v3)
residuals

# Previsoes
?predict
predictedValues <- predict(modelol_v1, dados_teste)
predictedValues
plot(dados_teste$mpg, predictedValues)

# Plot das variáveis mais relevantes no modelo
plot(varImp(modelol_v1))



