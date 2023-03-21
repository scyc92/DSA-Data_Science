# Explicabilidade de Modelos AutoML com SHAP (SHapley Additive exPlanations)

Neste mini-projeto o objetivo é  demonstrar na prática como explicar o resultado de um modelo de Machine Learning. E para deixar as coisas mais interessantes o modelo será criado através de AutoML. Trabalharemos no contexto de um problema na área de manutenção de máquinas industriais.

Uma empresa produz itens hospitalares através de uma das suas fábricas no Brasil.Cada fábrica possui diversos equipamentos industriais que periodicamente requerem manutenção. A empresa coletou dados históricos associando diferentes métricas (variáveis preditoras) à necessidade de manutenção do equipamento (sim ou não). A ideia é ter um modelo de Machine Learning capaz de prever quando cada máquina vai requerer manutenção e assim evitar paradas não programadas.Mas antes de usar um modelo preditivo a alta gerência necessita compreender como o modelo faz as previsões e quais métricas tem maior impacto na previsão do modelo.Você foi convidado a fazer uma apresentação sobre o tema! Qual seria o processo para responder às dúvidas da alta gerência?

Para este mini-projeto vamos criar uma massa de dados fictícios, que representam dados reais. 

## Dicionário de dados:
    Variável Preditora 1 (produtividade):Eficácia geral do equipamento: Esta é uma medida de produtividade, que descreve a parte do tempo em que uma máquina trabalha com desempenho máximo. A métrica é um produto da disponibilidade, desempenho e qualidade da máquina.

    Variável Preditora 2 (rendimento):Rendimento de primeira passagem: Esta é a parcela de produtos que saem da linha de produção e que não apresentam defeitos e atendem às especificações sem a necessidade de qualquer trabalho de retificação.

    Variável Preditora 3 (custo):Custo de energia por unidade: Este é o custo de eletricidade, vapor, óleo ou gás necessário para produzir uma determinada unidade de produto na fábrica.

    Variável Preditora 4 (prioridade): Prioridade do equipamento quando entrar no período de manutenção (Baixa, Media, Alta).

    Variável Preditora 5 (eficiencia):A quantidade de produto que uma máquina produz durante um período específico. Essa métrica também pode ser aplicada a toda a linha de produção para verificar sua eficiência.

    Variável Alvo (manutencao):
    - 0 significa que o equipamento não requer manutenção (não)
    - 1 significa que o equipamento requer manutenção (sim)
