# Lista de Exercícios e Solução

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap12")
getwd()


## Exercício 1 - Massa de dados aleatória

# Criando a massa de dados (apesar de aleatória, y possui 
# uma relação com os dados de x)
x <- seq(0, 100)
y <- 2 * x + 35

# Imprimindo as variáveis
x
y

# Gerando uma distribuição normal
y1 <- y + rnorm(101, 0, 50)
y1
hist(y1)

# Crie um plot do relacionamento de x e y1
plot(x, y1, pch = 19, xlab = 'X', ylab = 'Y')

# Crie um modelo de regressão para as duas variáveis x e y1
modelo <- lm(y1 ~ x)
modelo
class(modelo)

# Capture os coeficentes
a <- modelo$coefficients[1]
b <- modelo$coefficients[2]

# Fórmula de Regressão
y2 <- a + b*x

# Visualize a linha de regressão
lines(x, y2, lwd = 2)

# Simulando outras possíveis linhas de regressão
y3 <- (y2[51]-50*(b-1))+(b-1)*x
y4 <- (y2[51]-50*(b+1))+(b+1)*x
y5 <- (y2[51]-50*(b+2))+(b+2)*x
lines(x,y3,lty=3)
lines(x,y4,lty=3)
lines(x,y5,lty=3)


## Exercício 2 - Pesquisa sobre idade e tempo de reação

# Criando os dados
Idade <- c(9,13,14,21,15,18,20,8,14,23,16,21,10,12,20,
           9,13,5,15,21)

Tempo <- c(17.87,13.75,12.72,6.98,11.01,10.48,10.19,19.11,
           12.72,0.45,10.67,1.59,14.91,14.14,9.40,16.23,
           12.74,20.64,12.34,6.44)

# Crie um Gráfico de Dispersão (ScatterPlot)
plot(Idade, Tempo, 
     xlab = 'Idade', 
     ylab = 'Tempo de Reação')

# Crie um modelo de regressão
modelo <- lm(Tempo ~ Idade)
modelo

# Calcule a reta de regressão
y <- a + b*x
reta <- 25.8134 - 0.9491 * Idade

# Crie o gráfico da reta
lines(Idade,reta)


# Exercício 3 - Relação entre altura e peso

# Criando os dados
alturas = c(176, 154, 138, 196, 132, 176, 181, 169, 150, 175)
pesos = c(82, 49, 53, 112, 47, 69, 77, 71, 62, 78)

plot(alturas, pesos, pch = 16, cex = 1.3, col = "blue", 
     main = "Altura x Peso", 
     ylab = "Peso Corporal (kg)", 
     xlab = "Altura (cm)")

# Crie o modelo de regressão
modelo <- lm(pesos ~ alturas)

# Visualizando o modelo
modelo
summary(modelo)

# Gere a linha de regressão
abline(-70.4627, 0.8528)

# Faça as previsões de pesos com base na nova lista de alturas
alturas2 = data.frame(c(179, 152, 134, 197, 131, 178, 185, 162, 155, 172))
previsao <- predict(modelo, alturas2)
previsao

# Plot
plot(alturas, pesos, pch = 16, cex = 1.3, 
     col = "blue", 
     main = "Altura x Peso", 
     ylab = "Peso (kg)", 
     xlab = "Altura (cm)")

# Construindo a linha de regressão
abline(lm(pesos ~ alturas)) 

# Obtendo o tamanho de uma das amostras de dados
num <- length(alturas)
num

# Gerando um gráfico com os valores residuais
for (k in 1: num)  
  lines(c(alturas[k], alturas[k]), 
        c(pesos[k], pesos[k]))

# Gerando gráficos com a distribuição dos resíduos
par(mfrow = c(2,2))
plot(modelo)

