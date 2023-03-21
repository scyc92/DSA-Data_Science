# Medidas de Dispersão - Coeficiente de Variação 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap09")
getwd()


##### Coeficiente de Variação #####

# O coeficiente de variação indica a quantidade de variação de um conjunto de dados em relação a média. 
# O valor é dado por uma relação direta do quociente entre o desvio com a média da amostra.

# O coeficiente de variação (CV), mede o desvio padrão em termos de percentual da média. 
# Um CV alto, indica alta variabilidade dos dados, ou seja, menos consistência dos dados. 
# Um CV menor, indica mais consistência dentro do conjunto de dados.

# Quando comparamos a consistência entre 2 conjuntos de dados em relação a suas médias, 
# é melhor feito quando utilizamos coeficiente de variação. 


# Exemplo: Imagine que um investidor está decidindo se compra ações da Nike ou Adidas na bolsa de valores. 
# O valor médio da ação de cada empresa e o desvio padrão, são dados a seguir. 
# Qual deve ser a escolha do investidor?

# Nike ==> Valor médio da ação = $55.62 / desvio padrão = $5.10 
# Adidas ==> Valor médio da ação = $24.86 / desvio padrão = $3.60 

# CV = (desvio/media) * 100
CV_Nike   = (5.10/55.62) * 100
CV_Adidas = (3.60/24.86) * 100

print(CV_Nike)
print(CV_Adidas)

# Conclusão

# Um investidor se sentiria mais seguro em adquirir ações da Nike, pois o preço das ações 
# teria uma variação menor, podendo assim evitar perdas e permitindo ao investidor ter 
# um investimento mais seguro.


