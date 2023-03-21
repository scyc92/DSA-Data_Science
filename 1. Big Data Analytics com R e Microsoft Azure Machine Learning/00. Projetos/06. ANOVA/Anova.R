# Estatística na Prática 1 - Análise de Variância (ANOVA) 

# Leia os manuais em pdf no Capítulo 8 do curso.

# Dados fornecidos:
# Medicamento A = 4 5 4 3 2 4 3 4 4
# Medicamento B = 6 8 4 5 4 6 5 8 6
# Medicamento C = 6 7 6 6 7 5 6 5 5

# Lista com as respostas dos voluntários
nota_voluntario <- c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)
nota_voluntario

# Lista com o total de testes dos 3 medicamentos
medicamento <- c(rep("A",9), rep("B",9), rep("c",9))
medicamento

# Agora criamos um dataframe
df <- data.frame(nota_voluntario, medicamento)
View(df)

# Aplicamos ANOVA
?aov
teste_anova <-  aov(nota_voluntario ~ medicamento, data = df)
teste_anova

# Sumário do teste
summary(teste_anova)

# Conclusão:
# Valor-p < 0.05, ou seja, 0.000256 < 0.05, logo, rejeitamos a H0. 
# As médias dos grupos não são as mesmas e consequentemente os medicamentos não tem o mesmo efeito.





