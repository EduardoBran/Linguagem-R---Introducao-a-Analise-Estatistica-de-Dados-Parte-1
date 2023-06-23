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


# Criando base de dados

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




# Exercício 2

# - Suponha que você é um pesquisador que está estudando o efeito de diferentes dietas no peso corporal de ratos.
#   Você tem três grupos de ratos, cada um submetido a uma dieta específica (Dieta A, Dieta B e Dieta C), e deseja
#   determinar se há diferença significativa nos pesos médios dos ratos entre as três dietas.

# Aqui estão os pesos dos ratos em cada grupo:
  
# Dieta A: 20, 22, 19, 23, 21
# Dieta B: 18, 17, 20, 19, 16
# Dieta C: 25, 24, 26, 27, 23

# - Seu objetivo é realizar o teste ANOVA para determinar se há diferença significativa nos pesos médios entre as 3 dietas.
#   Em seguida, interprete os resultados do teste e responda às perguntas relacionadas.

# 1 - Há diferença significativa nos pesos médios dos ratos entre as três dietas?
# 2 - Se houver diferença, quais dietas têm pesos médios significativamente diferentes umas das outras?
# 3 - Se não houver diferença significativa, podemos concluir que os pesos médios dos ratos são aproximadamente iguais nas
#     três dietas?


# criando a base de dados

dieta_a <- c(20, 22, 19, 23, 21)
dieta_b <- c(18, 17, 20, 19, 16)
dieta_c <- c(25, 24, 26, 27, 23)

df <- data.frame(
  dieta = rep(c("A", "B", "C"), each = 5),
  peso = c(dieta_a, dieta_b, dieta_c)
)
View(df)


# Aplicando teste ANOVA

teste_anova <- aov(peso ~ dieta, data = df)
teste_anova

summary(teste_anova)


# 1 - Sim, há diferença significativa no tempo médio de entrega entre as dietas A, B e C. Isso é indicado pelo valor
#     extremamente baixo do valor-p (5.61e-05), que é menor do que o nível de significância comum de 0.05. Portanto,
#     podemos rejeitar a hipótese nula e concluir que existe diferença significativa nas dietas.
# 2 - Não tem como saber aplica apenas o teste ANOVA.
# 3 - Não podemos concluir que os pesos médios dos ratos são aproximadamente iguais nas três dietas.



