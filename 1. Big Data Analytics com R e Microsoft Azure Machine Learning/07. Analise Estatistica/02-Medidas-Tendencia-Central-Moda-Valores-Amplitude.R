# Medidas de Tendência Central - Moda, Valores Máximo e Mínimo e Amplitude 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap09")
getwd()


##### Moda #####

# A moda de uma distribuição é o valor que ocorre mais frequentemente, 
# ou o valor que corresponde ao intervalo de classe com a maior frequência. 

# A moda, da mesma forma que a mediana, não é afetada por valores extremos.

# Uma distribuição de frequência que apresenta apenas uma moda é chamada de unimodal. 
# Se a distribuição apresenta dois pontos de alta concentração ela é chamada de bimodal. 

# Distribuições bimodais ou multimodais podem indicar que na realidade a distribuição de frequência 
# se refere a duas populações cujas medidas foram misturadas. 

# Por exemplo, suponha que um lote de caixas de leite longa vida é amostrado e em cada caixa da 
# amostra é medido o volume envasado. Se o lote é formado pela produção de duas máquinas de envase 
# que estão calibradas em valores diferentes, é possível que o histograma apresente duas modas, 
# uma para cada valor de calibração.

# Exemplo: Uma loja de calçados quer saber qual o tamanho mais comprado em um dia de vendas. 
# A partir dos dados coletados a seguir, determine o tamanho mais pedido. 
tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
mean(tamanhos)  
median(tamanhos)

moda = function(dados) {
  vetor = table(as.vector(dados))
  names(vetor)[vetor == max(vetor)]
}

moda(tamanhos)


##### Valores Máximo e Mínimo #####

# Representam os valores máximos e mínimos da distribuição de dados

# Exemplo: Quais são os valores máximo e mínimo dos tamanhos de sapatos do item anterior.
tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
max(tamanhos)
min(tamanhos)


##### Amplitude #####

# A amplitude é a diferença entre o maior e menor valor de um conjunto de dados qualquer.

# Exemplo: Bob quer aprender a voar com asa delta, e ele quer saber qual a amplitude máxima que um voo pode ter. 
# A partir dos dados de outros praticantes de voo livre, determine qual a amplitude. 
dados = c(28, 31, 45, 58, 22, 33, 42, 68, 24, 37)
range(dados)
diff(range(dados))






