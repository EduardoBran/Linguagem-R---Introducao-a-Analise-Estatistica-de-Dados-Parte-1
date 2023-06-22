# Exercícios - Aplicando Análise de Variância (ANOVA) 



# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/8.Introducao-a-Analise-Estatistica-de-Dados---Parte-1")
getwd()


# Carregando pacotes

library(dplyr)      # manipulação de dados
library(stringr)    # manipulação de strings
library(tidyr)      # manipulação e organização de dados (separar e combinar colunas de dados)
library(tibble)     # manipula para transformar coluna em índice
library(lubridate)  # permite realizar operações comuns em datas

library(ggplot2)




# - Com base na resposta que desejamos obter, vamos definir as hipóteses para o teste estatístico:

#   -> H0 (Hipótese Nula)         = a MÉDIA dos grupos é a mesma.
#   -> Ha (Hipótese Alternativa)  = a MÉDIA de todos os grupos não é a mesma.

# - Regra geral de interpretação (considerando o valor-p de 0.05):

#   -> valor-p baixo (menor que 0.05): Forte evidência empírica contra H0 (rejeitamos a H0). Isso indica probabilidade
#                                      inferior a 5% de que a H0 está correta.
#   -> Valor-p alto (maior que 0.05) : Pouca ou nenhuma evidência empírica contra H0 (falhamos em rejeitar a H0).
#   -> Valor igual a 0.05            : O Cientista de Dados decide se rejeita ou não a H0 ou se refaz o teste.





# Exercício 1

# - Uma empresa de comércio eletrônico deseja comparar o tempo médio de entrega de seus produtos em três regiões
#   diferentes: A, B e C. Eles coletaram os dados de entrega de uma amostra aleatória de 30 produtos em cada região.
#   Os tempos de entrega, em dias, foram os seguintes:
  
# Região A: 5, 6, 4, 5, 7, 6, 5, 4, 6, 7, 5, 6, 7, 4, 5, 6, 5, 4, 6, 7, 6, 5, 4, 6, 5, 7, 6, 5, 6, 4
# Região B: 7, 8, 6, 9, 5, 7, 8, 6, 7, 9, 6, 8, 7, 6, 9, 8, 7, 6, 8, 9, 7, 6, 8, 9, 7, 6, 8, 7, 9, 8
# Região C: 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5

# Perguntas para interpretação da resposta do teste:
  
#  1 - Existe diferença significativa no tempo médio de entrega entre as regiões A, B e C?
#  2 - Se não houver diferença significativa, podemos concluir que os tempos médios de entrega são aproximadamente iguais nas
#      três regiões?


# Criando os dados

regiao_a <- c(5, 6, 4, 5, 7, 6, 5, 4, 6, 7, 5, 6, 7, 4, 5, 6, 5, 4, 6, 7, 6, 5, 4, 6, 5, 7, 6, 5, 6, 4)
regiao_b <- c(7, 8, 6, 9, 5, 7, 8, 6, 7, 9, 6, 8, 7, 6, 9, 8, 7, 6, 8, 9, 7, 6, 8, 9, 7, 6, 8, 7, 9, 8)
regiao_c <- c(6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5, 4, 7, 6, 5)

df <- data.frame(
  tempo_entrega = c(regiao_a, regiao_b, regiao_c),
  regiao = rep(c("A", "B", "C"), each = length(regiao_a))
)
View(df)


# Aplicando teste ANOVA

teste_anova <- aov(tempo_entrega ~ regiao, data = df)
teste_anova

summary(teste_anova)


# 1 - Sim, há diferença significativa no tempo médio de entrega entre as regiões A, B e C. Isso é indicado pelo valor
#     extremamente baixo do valor-p (1.47e-10), que é menor do que o nível de significância comum de 0.05. Portanto,
#     podemos rejeitar a hipótese nula e concluir que existe diferença significativa nos tempos médios de entrega entre as
#     regiões.
#
# 2 - Como o teste ANOVA indicou diferença significativa, não podemos concluir que os tempos médios de entrega são
#     aproximadamente iguais nas três regiões. A diferença significativa entre os grupos sugere que pelo menos uma das
#     regiões possui um tempo médio de entrega diferente das outras.











