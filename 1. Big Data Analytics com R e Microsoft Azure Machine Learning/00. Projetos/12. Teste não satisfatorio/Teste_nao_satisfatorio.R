# Estatística na Prática 5 - O Que Fazer Quando a Suposição do Teste Estatístico Não é Satisfeita?

# Leia os manuais em pdf no Capítulo 12 do curso.

# Há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento
# usado nos Porcos da Guiné?

# Imports
library(ggplot2)
library(GGally)

# Compreendendo o dataset
?ToothGrowth

# Carregando o dataset
data("ToothGrowth")
str(ToothGrowth)
View(ToothGrowth)
summary(ToothGrowth)

# Histograma da variável len
hist(ToothGrowth$len)

# GGPairs
ggpairs(ToothGrowth)

# Boxplots por tipo de suplemento
qplot(supp,
      len,
      data = ToothGrowth, 
      main = "Crescimento dos Dentes dos Porcos da Guiné Por Tipo de Suplemento",
      xlab = "Tipo de Suplemento", 
      ylab = "Comprimento do Dente") + 
  geom_boxplot(aes(fill = supp))

# Analisando os boxplots parece haver uma diferença no crescimento dos dentes, associada ao
# tipo de suplemento. Precisamos validar.

# Há diferença significativa no crescimento dos dentes de acordo com o tipo de suplemento
# usado nos Porcos da Guiné?


# Solução 1: Aplicar um Teste t de amostras independentes a fim de verificar se os tipos 
# de suplementos tem impacto no crescimento dos dentes dos animais. Hipóteses para o Teste t:

# H0 (Hipótese Nula) – Não há diferença significativa entre as médias dos 2 grupos 
# (logo o tipo de suplemento não tem impacto no crescimento dos dentes)
# H1 (Hipótese Alternativa) – Há diferença significativa entre as médias dos 2 grupos 
# (logo o tipo de suplemento tem impacto no crescimento dos dentes)

# Para aplicar o Teste t primeiro precisamos validar as 5 suposições do Teste.

# 1- Os dados são aleatórios e representativos da população.
# 2- A variável dependente é contínua.
# 3- Ambos os grupos são independentes (ou seja, grupos exaustivos e excludentes).
# 4- Os resíduos do modelo são normalmente distribuídos.
# 5- A variância residual é homogênea (princípio da homocedasticidade).

# Para o nosso exemplo neste estudo de caso, iremos considerar como verdadeiras as 
# suposições de 1 a 3 e validaremos as suposições 4 e 5. Para a suposição 4 usaremos 
# o Teste de Shapiro-Wilk e para a suposição 5 usaremos o Teste F.

# Validamos primeiro a suposição 5 usando o Teste F

# H0 = As médias de dados extraídos de uma população normalmente distribuída tem a mesma variância.
# H1 = As médias de dados extraídos de uma população normalmente distribuída não tem a mesma variância.
? var.test
var.test(len ~ supp, data = ToothGrowth)

# O valor-p é maior que 0.05. Falhamos em rejeitar a H0.
# Não há diferença significativa entre as variâncias dos 2 grupos.

# Validamos agora a suposição 4 

# Teste de Normalidade Shapiro-Wilk 
# H0: Os dados são normalmente distribuídos
# H1: Os dados não são normalmente distribuídos
?shapiro.test
shapiro.test(ToothGrowth$len[ToothGrowth$supp == 'OJ']) 
shapiro.test(ToothGrowth$len[ToothGrowth$supp == 'VC']) 

# O valor-p do primeiro grupo é menor que 0.05. Rejeitamos a H0.
# O valor-p do segundo grupo é maior que 0.05. Falhamos em rejeitar a H0.

# Uma das suposições do Teste t não foi satisfeita e o teste não pode ser usado.

# Observe o que acontece se você aplicar o Teste t:
# H0 (Hipótese Nula) – Não há diferença significativa entre as médias dos 2 grupos
df_OJ = ToothGrowth$len[ToothGrowth$supp == 'OJ']
df_VC = ToothGrowth$len[ToothGrowth$supp == 'VC']

t.test(df_OJ, df_VC, paired = FALSE, var.equal = FALSE, conf.level = 0.95) 

# O valor-p do teste é 0.06063, logo, maior que 0.05. Falhamos em rejeitar a H0.
# Podemos concluir que os 2 grupos não tem diferença significativa.
# Ou seja, não há diferença significativa entre os tipos de suplementos aplicados para o crescimento
# dos Porcos da Guiné. Compare com o resultado do Boxplot.

# A Solução 1 não é válida para esse tipo de problema pois os dados não satisfazem 
# uma das suposições.

# Será que a dosagem do suplemento é que realmente faz diferença e não o tipo de suplemento?
# Vamos verificar!


# Solução 2: Aplicar um Teste ANOVA a fim de verificar se as dosagens dos tipos de suplementos 
# é que causam impacto no crescimento dos dentes dos animais.

# Para usar o teste ANOVA, temos as seguintes suposições principais:

# 1- Dentro de cada amostra, as observações são amostradas aleatoriamente e independentemente umas das outras.
# 2- Cada amostra de grupo é extraída de uma população normalmente distribuída.

# Consideramos a suposição 1 como verdadeira e testaremos a suposição 2.

# Dividimos os dados em 3 grupos de acordo com a dosagem do suplemento
unique(ToothGrowth$dose)
dose_0_5 = ToothGrowth$len[ToothGrowth$dose == 0.5]
dose_1_0 = ToothGrowth$len[ToothGrowth$dose == 1]
dose_2_0 = ToothGrowth$len[ToothGrowth$dose == 2]

# Teste de Normalidade Shapiro-Wilk para cada grupo
# H0: Os dados são normalmente distribuídos
# H1: Os dados não são normalmente distribuídos
shapiro.test(dose_0_5) 
shapiro.test(dose_1_0) 
shapiro.test(dose_2_0) 

# O valor-p de todos os grupos é maior que 0.05. Falhamos em rejeitar a H0.
# As 3 amostras são normalmente distribuídas.

# ANOVA
teste_anova = aov(len ~ dose, ToothGrowth)
summary(teste_anova)

# Com base nesta análise unidirecional, a dosagem tem um efeito muito significativo no 
# comprimento do dente.

# Conclusão:

# O tipo de suplemento não parece ter diferença. 
# O que faz diferença para o crescimento dos dentes dos Porcos da Guiné é a 
# dosagem do suplemento.

# Ou ainda: o tipo de suplemento pode fazer diferença dependendo da dosagem!
# Podemos validar isso com um modelo de regressão linear.
?lm
modelo_lr = lm(len ~ supp + dose, ToothGrowth)
summary(modelo_lr)





