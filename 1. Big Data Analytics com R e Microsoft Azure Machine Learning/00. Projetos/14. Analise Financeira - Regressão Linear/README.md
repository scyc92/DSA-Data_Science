# Análise Financeira com Linguagem SQL e Regressão Linear em Linguagem R

O objetivo deste mini-projeto é unir duas poderosas ferramentas de análise de dadospararesolver um problema de negócio: Linguagem SQL será usada para análise exploratória de dados através do pacote sqldf e Linguagem R será usada para análise estatística.

Uma rede de hospitais gostaria de compreender as variáveis relacionadas aosgastoscom internações hospitalares de pacientes.Usaremos  dados  de  uma pesquisa  nacional  de  custos  hospitalares  realizada  pela  US Agency  for  Healthcare que consiste  em  registros  hospitalares  de  amostras  de  pacientes internados. Os dados fornecidos são restritos à cidade de Wisconsin e referem-se a pacientes na faixa etária de 0 a 17 anos. Vamos separar o trabalho em duas etapas. Na etapa 1 vamos explorar os dados usando Linguagem  SQL  e  responder  10  perguntas  de  negócio.  Na  etapa  2  vamos  realizar  análise estatística com Linguagem R através do Teste ANOVA e Regressão Linear e responder 7 perguntas de negócio.

O  dataset  (disponível junto  com  o  script  R  ao  final  do  capítulo)  foi  gerado  a  partir  das fontes abaixo:

https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Cost-Report/HospitalCostPUF

https://healthdata.gov/

## Dicionário de dados:

    AGE: Idade do paciente
    FEMALE: Variável binária que indica se o paciente é do sexo feminino
    LOS(Length of stay): Tempo da internação do paciente
    RACE: Raça do paciente
    TOTCHG: Custo da internação
    APRDRG: Grupo dediagnóstico refinado do paciente


## Análise exploratória de dados com Linguagem SQL

    Abaixo as perguntas que devem ser respondidas na análise exploratória de dados com Linguagem SQL:
    
    1-Quantas raças estão representadas no dataset?
    2-Qual a idade média dos pacientes?
    3-Qual a moda da idade dos pacientes?
    4-Qual a variância da coluna idade?
    5-Qual o gasto total com internações hospitalares por idade?
    6-Qual idade gera o maior gasto total com internações hospitalares?
    7-Qual o gasto total com internações hospitalares por gênero?
    8-Qual a média de gasto com internações hospitalares por raça do paciente?9-Para  pacientes  acima  de  10  anos,  qual  a  média  de  gasto  total  com  internações hospitalares?
    10-Considerando o item anterior, qual idade tem média de gastos superior a 3000?

## Análise estatística

    Abaixo as perguntas que devem ser respondidas na análise estatística:

    1-Qual a distribuição da idade dos pacientes que frequentam o hospital?
    2-Qual faixa etária tem o maior gasto total no hospital?
    3-Qual grupo baseado em diagnóstico (Aprdrg) tem o maior gasto total no hospital?
    4-A raça do paciente tem relação com o total gasto em internações no hospital?
    5-A combinação de idade e gênero dos pacientes influencia no gasto total em internações no hospital?
    6-Como o tempo de permanência é o fator crucial para pacientes internados, desejamos descobrir se o tempo de permanência pode ser previsto a partir de idade, gênero e raça.
    7-Quais variável têm maior impacto nos custos de internação hospitalar?