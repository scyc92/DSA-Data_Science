# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permita listar todos os arquivos no 
# diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, 
# um lógico e um de números
charac_vec <- c("A", "B", "C")
num_vec <- c(4.5, 3.9, 7.2)
logic_vec <- c(TRUE, TRUE, FALSE)
df1 <- data.frame(charac_vec, num_vec, logic_vec)
df1

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número 
# e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for (i in 1:length(vec1)){
  if (vec1[i] > 10) {
    print(vec1[i])
    print('Este elemento do vetor é maior que 10')
  } else  {
    print(vec1[i])
    print('Este elemento do vetor é menor que 10')
  } 
}


# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console 
# cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (i in 1:length(lst2)) {
  print(lst2[[i]])
}


# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as matrizes
# https://www.mathwarehouse.com/algebra/matrix/multiply-matrix.php
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 <- mat1 * mat2	
mat3

# Multiplicação de matrizes 
# (multiplica primeira linha da mat1 com a primeira coluna de mat2
# Item [1,1] ==> (1 x 1) + (2 x 2) + (3 x 3) x (4 x 4) x (5 x 5) = 55
# Item [2,1] ==> (6 x 1) + (7 x 2) + (8 x 3) x (9 x 4) x (10 x 5) = 130
# Item [3,1] ==> (11 x 1) + (12) x 2) + (13 x 3) x (14 x 4) x (15 x 5) = 205
mat4 <- mat1 %*% mat2
mat4

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação 
# de cada um dos objetos
vec1 <- c(12, 3, 4, 19, 34)
names(vec1) <- c('Col1', 'Col2', 'Col3', 'Col4', 'Col5')
vec1

mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
dimnames(mat1) = (list( c("Obs1", "Obs2", "Obs3", "Obs4", "Obs5"), c("Var1", "Var2", "Var3", "Var4", "Var5")))
mat1

lst1 <- list(2, 3, c(1, 2, 3))
names(lst1) <- c('dim1', 'dim2', 'dim3')
lst1

df1 <- data.frame(c("A", "B", "C"), c(4.5, 3.9, 7.2), c(TRUE, TRUE, FALSE))
colnames(df1) <- c('Caracteres', 'Float', 'Logico')
rownames(df1) <- c("Obs1", "Obs2", "Obs3")
df1

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória 
# para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2
?sample
mat2[sample(1:50, 10)] = NA
mat2


# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)
colSums(mat1)


# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
order(a)
a[order(a)]


# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo 
# que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for (i in mat1){
  if(i > 15){
    print(i)
  }
}