# Medidas de Dispersão - Desvio Padrão e Variância 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap09")
getwd()


##### Desvio Padrão #####

# O desvio padrão indica o grau de variação de um conjunto de dados, este conjunto pode ser amostral ou populacional.

# Para um conjunto amostral o desvio padrão é dado pelo somatório da raiz quadrada do quadrado da diferença entre 
# o valor do dado coletado (xi) e o valor médio (x), dividido pelo tamanho amostral menos um (n−1).

# Exemplo: Um engenheiro precisa decidir entre três modelos de máquinas de corte de alta precisão,
# para isso ele usa como critério o desvio padrão. A máquina que tiver menor desvio será a escolhida por ele. 
# A partir dos dados de medida de corte das 3 máquinas, determine qual deve ser a escolhida pelo engenheiro. 
# Máquina 1 (mm) = (181.9, 180.8, 181.9, 180.2, 181.4). 
# Máquina 2 (mm) = (180.1, 181.8, 181.5, 181.2, 182.4). 
# Máquina 3 (mm) = (182.1, 183.7, 182.1, 180.2, 181.9).

Maq1 = c(181.9, 180.8, 181.9, 180.2, 181.4)
Maq2 = c(180.1, 181.8, 181.5, 181.2, 182.4)
Maq3 = c(182.1, 183.7, 182.1, 180.2, 181.9)

mean(Maq1)
mean(Maq2)
mean(Maq3)

sd(Maq1) 
sd(Maq2)
sd(Maq3)


##### Variância #####

# A variância também é um importante indicador de variabilidade dos dados. 
# Como a soma dos desvios sempre somarão zero, é necessário usar uma medida de variabilidade que torne 
# os desvios negativos em valores não negativos, para que a soma dos desvios represente um valor 
# de variabilidade do conjunto de dados diferente de zero.

# A variância então é o quadrado do desvio padrão. 

# As medidas amostrais tem n−1 graus de liberdade. 

# Graus de liberdade é a diferença entre 
# a dimensão da amostra (n) e a quantidade de parâmetros a serem avaliados na população. 

# No caso da variância amostral, é usada como referência a média da amostra e isso tornaria o 
# valor da variância amostral menor do que o da variância populacional, devido aos valores 
# coletados estarem mais próximos da média amostral. 

# Para corrigir isso o divisor perde 1 grau de liberdade e quando se trata das medidas 
# amostrais utilizamos o n−1.

# Cálculo da variância para o exemplo anterior.

var(Maq1) 
var(Maq2)
var(Maq3)







