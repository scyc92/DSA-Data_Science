# Estatística na Prática 2 - Teste de Shapiro-Wilk, Teste F e Teste t

# Leia os manuais em pdf no Capítulo 9 do curso.

# Nosso objetivo neste estudo é responder a seguinte pergunta:
  
# “Existe diferença significativa na média de sono dos 2 grupos de pacientes, ou seja, 
# há diferença significativa entre os dois medicamentos que ajudam no distúrbio do sono?”

# Vamos aplicar o Teste t e responder a pergunta.

# Pacotes
if(!require(car)) install.packages("car")
library(car)
library(tidyverse)

View(sleep)
?sleep

# Para aplicar o Teste t primeiro precisamos validar as 5 suposições do Teste.

# 1- Os dados são aleatórios e representativos da população.
# 2- A variável dependente é contínua.
# 3- Ambos os grupos são independentes (ou seja, grupos exaustivos e excludentes).
# 4- Os resíduos do modelo são normalmente distribuídos.
# 5- A variância residual é homogênea (princípio da homocedasticidade).

# Para o nosso exemplo neste estudo de caso, iremos considerar como verdadeiras as 
# suposições de 1 a 3 e validaremos as suposições 4 e 5. Para a suposição 4 usaremos 
# o Teste de Shapiro-Wilk e para a suposição 5 usaremos o Teste F.

# Vamos extrair dados de um dos grupos
grupo_dois <- sleep$group == 2

# Validando a Suposição 4 com qqPlot
?qqPlot
qqPlot(sleep$extra[grupo_dois])
qqPlot(sleep$extra[! grupo_dois])

# Análise: Os pontos de dados da variável "extra" estão dentro da área de confiança, 
# indicando que os dados seguem uma distribuição normal.

# Validando a Suposição 4 com teste de normalidade shapiro.test()
# Para dizer que uma distribuição é normal, o valor-p precisa ser maior do que 0,05.
# H0 = Os dados seguem uma distribuição normal.
?shapiro.test
shapiro.test(sleep$extra[grupo_dois]) # valor-p = 0.3511 > 0.05 
shapiro.test(sleep$extra[! grupo_dois]) # valor-p = 0.4079 > 0.05

# O valor-p do teste de cada grupo é maior que 0.05 e então falhamos em rejeitar a H0.
# Podemos assumir que os dados seguem uma distribuição normal.

# Validando a Suposição 5 com Teste F

# Primeiro checamos se há valores ausentes
colSums(is.na(sleep)) 

# Vejamos um resumo estatístico do dataset
sleep %>% group_by(group) %>%
  summarise(
    count = n(),
    mean = mean(extra, na.rm = TRUE),
    sd = sd(extra, na.rm = TRUE))

# Para rejeitar a hipótese nula de que as médias do grupo são iguais, precisamos de um valor F alto.
# H0 = As médias de dados extraídos de uma população normalmente distribuída tem a mesma variância.
?var.test
resultado_teste_f <- var.test(extra ~ group, data = sleep)
resultado_teste_f 

# O valor-p é de 0.7427, logo, maior que 0.05. Falhamos em rejeitar a H0.
# Não há diferença significativa enre as variâncias dos 2 grupos.

# Suposições validadas. Agora sim podemos aplicar o Teste t.

# Aplicamos o Teste t para responder a questão:
# H0 (Hipótese Nula) – Não há diferença significativa entre as médias dos 2 grupos
?t.test
resultado_teste_t <- t.test(extra ~ group, data = sleep, var.equal = TRUE)
resultado_teste_t 

# Análise Final:

# O valor-p do teste é 0.07919, logo, maior que 0.05. Falhamos em rejeitar a H0.
# Podemos concluir que os 2 grupos não tem diferença significativa.
# Não há diferença significativa entre os medicamentos aplicados para tratar distúrbios do sono.





