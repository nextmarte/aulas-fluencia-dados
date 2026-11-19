# ============================================================
# Aula 2 — R4DS (Cap. 2 -> Cap. 3 & 12) + Prova RFB 2023
# ============================================================

# 1. Tabelas no R: criando um data.frame (R base — sem pacotes)
notas_rfb <- data.frame(
  materia = c("Portugues", "Estatistica", "Fluencia em Dados", "Direito Tributario"),
  acertos = c(8, 5, 9, 7),
  total   = c(10, 6, 10, 10)
)

notas_rfb
str(notas_rfb)
summary(notas_rfb)

# 2. Selecionando colunas e filtrando linhas (R base)
notas_rfb$acertos
mean(notas_rfb$acertos)

# [linha, coluna]
notas_rfb[1, ]                 # primeira linha
notas_rfb[, "materia"]         # coluna materia
notas_rfb[notas_rfb$acertos >= 8, ]   # filtro logico
subset(notas_rfb, acertos >= 8)       # alternativa legivel

# (Se ja tiver tidyverse instalado, o equivalente do R4DS Cap. 3 e:)
# library(dplyr)
# notas_rfb |>
#   filter(acertos >= 8) |>
#   select(materia, acertos) |>
#   mutate(taxa = acertos / total)

# 3. Aplicando R no PDF da RFB 2023 — Q27 (Estatistica, pag. 39)
a1 <- c(-5, -3, -1, 1, 3, 5, 7)
a2 <- c(22, 26, 30, 34, 38)
a3 <- c(100, 101, 102, 103)
a4 <- c(1, 2, 3, 5, 10)
a5 <- c(0.5, 2.0, 3.5, 5.0, 6.5)

tabela_q27 <- data.frame(
  amostra = 1:5,
  media   = c(mean(a1), mean(a2), mean(a3), mean(a4), mean(a5)),
  desvio  = round(c(sd(a1), sd(a2), sd(a3), sd(a4), sd(a5)), 2)
)
tabela_q27

# Q32 (Coeficiente de determinacao, pag. 46)
r <- 0.756
round(r^2, 2)

# 4. Condicional if / else e funcoes proprias (R4DS Cap. 25)
situacao <- function(nota) {
  if (nota >= 7) {
    "Aprovada"
  } else {
    "Revisar"
  }
}
situacao(8)
situacao(5)

# 5. Questao Real de R — Analista-Tributario RFB 2023 (FGV)
lista <- function(param) {
  if (param > -3) {
    temp <- param + lista(param - 3)
    print(temp)
  } else {
    return(0)
  }
}
lista(6)   # aquecimento
lista(15)  # chamada real da prova

# 6. Ponte PDF (Q80 SQL) <-> R4DS Cap. 12 (Logica de 3 estados / NA)
(TRUE | FALSE) & (NA | TRUE)   # Item I  -> TRUE
TRUE & ((NA | FALSE) | NA)     # Item II -> NA (unknown)
!(NA & (NA & NA))              # Item III -> NA (unknown)
