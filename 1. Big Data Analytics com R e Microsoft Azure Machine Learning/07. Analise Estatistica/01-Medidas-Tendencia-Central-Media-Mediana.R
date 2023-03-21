# Medidas de Tendência Central - Média e Mediana 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap09")
getwd()


##### Medidas de Tendência Central #####

# As medidas de tendência central são valores representativos da distribuição 
# em torno da qual as outras medidas se distribuem. 

# Duas medidas são as mais utilizadas: a média aritmética e a mediana.


##### Média #####

# A média aritmética de um conjunto de n valores, como o próprio nome indica, é obtida somando-se 
# todas as medidas e dividindo-se a soma por n. 

# Representamos cada valor individual por uma letra (x, y, z, etc.) seguida por um sub-índice, ou seja, 
# representamos os n valores da amostra por x1, x2, x3, …, xn, onde x1 é a primeira observação, 
# x2 é a segunda e assim por diante. 

# Exemplo: A lista abaixo possui as notas de 10 alunos de um curso de graduação no exame final. Calcule a média.
notas = c(6.4, 7.3, 9.8, 7.3, 7.9, 8.2, 9.1, 5.6, 8.5, 6.8) 
notas
?mean
mean(notas)  
print(mean(notas))


##### Mediana #####

# A mediana é uma medida alternativa à média aritmética para representar o centro da distribuição, 
# muito usada em estatística descritiva. 

# A mediana de um conjunto de medidas (x1, x2, x3, …, xn) é um valor M tal que pelo menos 50% das medidas 
# são menores ou iguais a M e pelo menos 50% das medidas são maiores ou iguais a M. 

# Em outras palavras, 50% das medidas ficam abaixo da mediana e 50% acima.

# Se o número de elementos for ímpar, a mediana é o elemento do meio: n / 2
# Se o número de elementos for par, a mediana ainda é o elemento do meio, mas calculado assim: (n + 1) / 2

# Exemplo: Os dados da lista abaixo são tempos de vida (em dias) de 8 lâmpadas. Calcule a média e a mediana.
tempos = c(400, 350, 510, 550, 690, 720, 750, 2000)
mean(tempos)
?median
median(tempos) 











