## code to prepare `mun_reg_saude` dataset goes here

library(tidyverse)

load("data-raw/mun_reg_saude.rda")

mun_reg_saude <- mun_reg_saude |>
  rename(code_muni = cod_mun, codi_reg_saude = cod_reg_saude)

usethis::use_data(mun_reg_saude, overwrite = TRUE, compress = "xz")
