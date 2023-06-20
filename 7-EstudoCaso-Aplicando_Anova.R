# Estudo de Caso
# Estatística na Prática 1 - Aplicando Análise de Variância (ANOVA) 



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



# Conceituando o Teste Estatístico ANOVA

# - ANOVA (Análise de Variância) é um teste estatístico utilizado para verificar se as "MÉDIAS" de dois ou mais grupos são
#   significativamente diferentes entre si. Normalmente a ANOVA será aplicada para comparar mais de 2 grupos.
# - A ANOVA é semelhane ao teste t (será visto mais adiante), a diferença é que se você quiser comparar mais de dois grupos
#   usaremos a ANOVA.

# - Assim como a maioria dos testes estatísticos, a parte técnica não é o problema pois implementamos ANOVA com uma linha de 
#   código em R. O maior desafio está na definição das hipóteses e na interpretação do resultado.


# Descrição do Estudo de Caso e Definição das Hipóteses

# - Uma empresa farmacêutica testou três formulações de um medicamento para alívio da dor para quem sofre de dor de cabeça.
# - Para o experimento, 27 voluntários foram selecionados e 9 foram aleatoriamente designados para uma das três formulações
#   do medicamento.
# - Os indivíduos foram instruídos a tomar o medicamento durante o próximo episódio de enxaqueca e relatar sua dor em uma
#   escala de 1 a 10 (sendo 10 a dor mais forte).
# - Iremos criar uma massa de dados de teste simulando esses resultados.


# - Precisamos comparar se todos os três medicamentos geram o mesmo efeito ou não. Ou seja:

#   -> Se a MÉDIA de cada grupo é a mesma ou muito similar, significa que todos os três medicamentos são eficazes.
#   -> Se a MÉDIA é diferente, significa que de três, apenas um ou dois medicamentos são eficazes.

# - Com base na resposta que desejamos obter, vamos definir as hipóteses para o teste estatístico:

#   -> H0 (Hipótese Nula)         = a MÉDIA dos grupos é a mesma.
#   -> Ha (Hipótese Alternativa)  = a MÉDIA de todos os grupos não é a mesma.


# - A ANOVA será usada como teste estatístico neste cenário. Nosso objetivo é rejeitar ou não a H0
#   (Nunca deveos dizer que aceitamos ou não. Devemos dizer que falhamos ou não em rejeitar a H0).

# - O resultado da ANOVA será interpretado com base no valor-p. Valor-p é a probabilidade de que a estatística do teste
#   assuma um valor extremo em relação ao valor observado quando H0 é verdadeira.

# - Regra geral de interpretação (considerando o valor-p de 0.05):

#   -> valor-p baixo (menor que 0.05): Forte evidência empírica contra H0 (rejeitamos a H0). Isso indica probabilidade
#                                      inferior a 5% de que a H0 está correta.
#   -> Valor-p alto (maior que 0.05) : Pouca ou nenhuma evidência empírica contra H0 (falhamos em rejeitar a H0).
#   -> Valor igual a 0.05            : O Cientista de Daos decide se rejeita ou não a H0 ou se refaz o teste.





# Dados fornecidos:
#
# Medicamento A = 4 5 4 3 2 4 3 4 4
# Medicamento B = 6 8 4 5 4 6 5 8 6
# Medicamento C = 6 7 6 6 7 5 6 5 5


# Dados simulando a lista de respostas dos voluntários

nota_voluntario <- c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)
nota_voluntario

# Dados simulando a aista com o total de testes dos 3 medicamentos

medicamento <- c(rep("A",9), rep("B",9), rep("c",9))
medicamento

# Criando um dataframe

df <- data.frame(nota_voluntario, medicamento)
View(df)




















# Aqui estão alguns pontos adicionais para ajudar na compreensão:

# - A ANOVA é usada para comparar as médias de dois ou mais grupos e determinar se existem diferenças estatisticamente 
#   significativas entre eles.
#
# - Ela é uma extensão do teste t de Student, que é usado para comparar as médias de dois grupos. A diferença é que a ANOVA
#   permite comparar mais de dois grupos ao mesmo tempo.
#
# - A ANOVA divide a variação total dos dados em duas componentes: a variação entre os grupos (entre-group variation) e a
#   variação dentro dos grupos (within-group variation).
#
# - O teste ANOVA calcula a estatística F, que compara a variabilidade entre os grupos com a variabilidade dentro dos grupos.
#   Se a diferença entre as médias dos grupos for maior do que a variabilidade esperada dentro dos grupos, a estatística F
#   será grande e a diferença será considerada estatisticamente significativa.
#
# - As hipóteses nulas e alternativas para o teste ANOVA são definidas da seguinte forma:
#   Hipótese nula (H0): Não há diferença significativa entre as médias dos grupos.
#   Hipótese alternativa (Ha): Pelo menos uma das médias dos grupos é significativamente diferente das outras.
#
# - A interpretação do resultado envolve analisar o valor-p (p-value). Se o valor-p for menor que um nível de significância
#   pré-definido (geralmente 0,05), rejeitamos a hipótese nula e concluímos que existe uma diferença significativa entre as
#   médias dos grupos.
#
# - Após a rejeição da hipótese nula, pode ser necessário realizar testes adicionais, como testes post hoc, para identificar
#   quais grupos diferem significativamente entre si.
#
#
# - É importante lembrar que a aplicação correta da ANOVA depende da estrutura dos dados, da verificação dos pressupostos do
#   teste e da interpretação adequada dos resultados. Além disso, existem diferentes variantes da ANOVA, como ANOVA de um
#   fator, ANOVA de dois fatores, ANOVA de medidas repetidas, entre outras, que podem ser aplicadas em diferentes situações.



