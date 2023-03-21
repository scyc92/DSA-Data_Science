# Coeficiente de Assimetria (Skewness) 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap09")
getwd()


##### Coeficiente de Assimetria #####

# O coeficiente de assimetria é o que permite dizer se uma determinada distribuição é assimétrica ou não.

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = "Número de Acidentes Diários", xlab = "Acidentes", ylab = "Frequência")

mean(dados)
sd(dados)
median(dados)

library(moments)
?skewness
SK = skewness(dados)
print(SK)

# Sk ≈ 0: dados simétricos. Tanto a cauda do lado direito quanto a do lado esquerdo da função densidade de probabilidade são iguais.
# Sk < 0: assimetria negativa. A cauda do lado esquerdo da função densidade de probabilidade é maior que a do lado direito.
# Sk > 0: assimetria positiva. A cauda do lado direito da função densidade de probabilidade é maior que a do lado esquerdo.

# O coeficiente de assimetria é 0.2549279. 
# Como o coeficiente de assimetria é maior que 0, diz-se que a curva apresenta assimetria positiva 
# e a cauda do lado direito da função densidade de probabilidade é maior que no lado esquerdo. 
# Ao observar também o Histograma, percebe-se que há maior densidade de dados do lado direito. 

# Outro exemplo
set.seed(1234)
x = rnorm(1000)
hist(x)
skewness(x)





