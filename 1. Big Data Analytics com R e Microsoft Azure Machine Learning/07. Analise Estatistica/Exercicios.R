# Lista de Exercícios e Solução

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap10")
getwd()


# Exercício 1 - Gere 1000 números de uma distribuição normal com média 3 e sd = .25 e grave no objeto chamado x.
?rnorm
x <- rnorm(1000, 3, .25)


# Exercício 2 - Crie o histograma dos dados gerados no item anterior e adicione uma camada com a curva da normal.
hist(x, prob=TRUE, ylim=c(0,1.80), breaks=20, main = "Histograma de x")
curve(dnorm(x, 3, 0.25), add=TRUE, col="red", lwd=1)


# Exercício 3 - Suponha que 80% dos adultos com alergias relatem alívio sintomático com uma medicação específica. 
# Se o medicamento é dado a 10 novos pacientes com alergias, qual é a probabilidade de que ele seja 
# eficaz em exatamente sete?
dbinom(7, 10, 0.8)

graph <- function(n,p){
  x <- dbinom(0:n,size=n,prob=p)
  barplot(x,ylim=c(0,0.4),names.arg=0:n,
          main=sprintf(paste('Binomial Distribution(n,p) ',n,p,sep=',')))
}
graph(10,0.8)



# Exercício 4 - Suponha que os resultados dos testes de um vestibular se ajustem a uma distribuição normal. 
# Além disso, a pontuação média do teste é de 72 e o desvio padrão é de 15,2. 
# Qual é a porcentagem de alunos que pontuaram 84 ou mais no exame?

# Aplicamos a função pnorm da distribuição normal com média 72 e desvio padrão 15.2. 
# Como estamos procurando a porcentagem de alunos com pontuação superior a 84, 
# estamos interessados na cauda superior da distribuição normal.
pnorm(84, mean=72, sd=15.2, lower.tail=FALSE) 


# Exercício 5 - Suponha que o tempo médio de check-out de um caixa de supermercado seja de três minutos. 
# Encontre a probabilidade de um check-out do cliente ser concluído pelo caixa em menos de dois minutos.

# A taxa de processamento de checkout é igual a uma dividida pelo tempo médio de conclusão da finalização. 
# Por isso, a taxa de processamento é de 1/3 de checkouts por minuto. 
# Em seguida, aplicamos a função pexp da distribuição exponencial com taxa = 1/3.
pexp(2, rate=1/3) 


# Exercício 6 - Selecione dez números aleatórios entre um e três.
# Aplicamos a função de geração runif da distribuição uniforme para gerar dez números aleatórios entre um e três.
runif(10, min=1, max=3) 


# Exercício 7 - Se houver 12 carros atravessando uma ponte por minuto, em média, 
# encontre a probabilidade de ter 15 ou mais carros cruzando a ponte em um determinado minuto.
# A probabilidade de ter 14 ou menos carros atravessando a ponte em um determinado minuto é dada pela função ppois.
?ppois
ppois(14, lambda=12)   # lower tail 

# Assim, a probabilidade de ter 15 ou mais carros cruzando a ponte em um minuto está na 
# cauda superior da função de densidade de probabilidade.
ppois(15, lambda=12, lower=FALSE)   # upper tail 


# Exercício 8 - Suponha que haja 12 questões de múltipla escolha em um questionário de inglês. 
# Cada questão tem cinco respostas possíveis e apenas uma delas está correta. 
# Encontre a probabilidade de ter quatro ou menos respostas corretas se um aluno tentar 
# responder a cada pergunta aleatoriamente.

# Como apenas uma das cinco respostas possíveis está correta, a probabilidade de responder corretamente 
# a uma pergunta aleatória é 1/5 = 0,2. Podemos encontrar a probabilidade de ter exatamente 4 respostas 
# corretas por tentativas aleatórias como segue.
dbinom(4, size=12, prob=0.2) 

# Para encontrar a probabilidade de ter quatro ou menos respostas corretas por tentativas aleatórias, 
# aplicamos a função dbinom com x = 0,…, 4.
dbinom(0, size=12, prob=0.2) + 
  dbinom(1, size=12, prob=0.2) + 
  dbinom(2, size=12, prob=0.2) + 
  dbinom(3, size=12, prob=0.2) + 
  dbinom(4, size=12, prob=0.2) 

# Ou então:
pbinom(4, size=12, prob=0.2) 