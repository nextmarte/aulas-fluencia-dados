# ============================================================
# Aula 2 — Indexacao, if/else, Funcoes e Questoes RFB 2023
# ============================================================

# 1. Indexacao com colchetes [ ] (em R comeca no 1!)
frutas <- c("manga", "banana", "pera", "laranja")
frutas[1]
frutas[3]
frutas[c(1, 2, 4)]

# 2. Filtrando textos com grep()
grep("n", frutas)
frutas[grep("n", frutas)]

# 3. Condicional if / else
nota <- 8
if (nota >= 7) {
  print("Aprovada")
} else {
  print("Revisar")
}

# 4. Criando suas proprias funcoes
dobro <- function(x) {
  return(x * 2)
}
dobro(15)

# Retorno implicito (sem return)
situacao <- function(nota) {
  if (nota >= 7) {
    "Aprovada"
  } else {
    "Revisar"
  }
}
situacao(8)
situacao(5)

# 5. Questao Real #1 — Auditor-Fiscal RFB 2023 (FGV - Q76)
search_string <- function(lista, palavra) {
  return(lista[grep(palavra, lista)])
}
palavras <- c("manga", "banana", "pera", "laranja")
search_string(palavras, "n")

# 6. Questao Real #2 — Analista-Tributario RFB 2023 (FGV)
lista <- function(param) {
  if (param > -3) {
    temp <- param + lista(param - 3)
    print(temp)
  } else {
    return(0)
  }
}
lista(15)
