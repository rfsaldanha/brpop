## code to prepare `mun_reg_saude` dataset goes here

library(tidyverse)

load("data-raw/regsaude/mun_reg_saude.rda")

mun_reg_saude <- mun_reg_saude |>
  rename(code_muni = cod_mun, codi_reg_saude = cod_reg_saude)

# Boa Esperança do Norte (IBGE 5101837) belongs to the Teles Pires health
# region. Municipality codes in this table use six digits.
mun_reg_saude <- mun_reg_saude |>
  bind_rows(tibble(code_muni = 510183, codi_reg_saude = 5114)) |>
  distinct(code_muni, .keep_all = TRUE)

usethis::use_data(mun_reg_saude, overwrite = TRUE, compress = "xz")
