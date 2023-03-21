# Estatística na Prática 4 - Análise, Interpretação e Exercício com Teste do Qui-Quadrado

# Leia os manuais em pdf no Capítulo 11 do curso.

# Suposição do teste:
# As variáveis devem ser independentes!

# Carregando o dataset
df = read.csv("dados.csv")

# Visualizando os dados
View(df)

# Dimensões
dim(df)

# Separando x e y
x = df$Tipo_Imovel
unique(x)

y = df$Status_Imovel
unique(y)

# Tabela cruzada
table(x, y)
prop.table(table(x, y))

# Definindo as hipóteses:

# H0 = Não há relação entre x e y
# H1 = x e y estão relacionados

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Teste do Qui-Quadrado
?chisq.test
chisq.test(table(x, y))

# Exercício:

# Se não considerarmos os imóveis do tipo Apartamento, há diferença no resultado do teste?

# Definindo as hipóteses:

# H0 = Não há relação entre x e y
# H1 = x e y estão relacionados

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Carrega os dados 
dados = read.csv("dados.csv")
dim(dados)

# Extrai um subset filtrando os dados conforme condição proposta para este exercício
dados = droplevels(subset(dados, Tipo_Imovel != "Apartamento"))
dim(dados)
View(dados)

# Separa as variáveis
x = dados$Tipo_Imovel
y = dados$Status_Imovel

# Tabela cruzada
table(x, y)

# Executa o teste
chisq.test(table(x, y))

