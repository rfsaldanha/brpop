## code to prepare `mun_reg_saude_449` dataset goes here

library(tidyverse)

# Import data
mun_reg_saude_449 <- readr::read_csv2(file = "data-raw/rs449.csv") %>%
  dplyr::select(code_muni = cod_munic, codi_reg_saude = cod_cgrs)

# Check number length of reg saude. Should be 449
# length(unique(mun_reg_saude_449$cod_reg_saude))

usethis::use_data(mun_reg_saude_449, overwrite = TRUE, compress = "xz")
