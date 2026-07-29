## code to prepare `mun_reg_saude_449` dataset goes here

library(tidyverse)

# Import data
mun_reg_saude_449 <- readr::read_csv2(file = "data-raw/regsaude/rs449.csv") %>%
  dplyr::select(code_muni = cod_munic, codi_reg_saude = cod_cgrs)

# Boa Esperança do Norte (IBGE 5101837) belongs to the Teles Pires health
# region. Municipality codes in this table use six digits.
mun_reg_saude_449 <- mun_reg_saude_449 |>
  dplyr::bind_rows(tibble::tibble(
    code_muni = 510183,
    codi_reg_saude = 51014
  )) |>
  dplyr::distinct(.data$code_muni, .keep_all = TRUE)

# Check number length of reg saude. Should be 449
# length(unique(mun_reg_saude_449$cod_reg_saude))

usethis::use_data(mun_reg_saude_449, overwrite = TRUE, compress = "xz")
