#' Cria um banco de dados único (em formato longo) com as estimativas populacionais por sexo e faixa etária, ordenado por município, ano, sexo e faixa etária.
#' A faixa etária é transformada em fator, com os rótulos de categorias ("levels") modificados para "0-4", "5-9", ... "80 e +".
#'
library(brpop)
library(dplyr)

data("mun_female_pop")
data("mun_male_pop")

faixas <- c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34",  "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80 e +")

popbr <- bind_rows(
  mun_female_pop %>% mutate(sex = "masc"),
  mun_female_pop %>% mutate(sex = "fem")
) %>%
  filter(age_group != "Total",
         substr(mun, 3, 6) != "0000") %>%
  mutate(age_group = factor(age_group,
                            levels = unique(age_group),
                            labels = faixas)) %>%
  relocate(sex, .after = year) %>%
  arrange(mun)

popbr


