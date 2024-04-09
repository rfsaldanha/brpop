## code to prepare `mun_reg_saude` dataset goes here

mun_reg_saude <- rpcdas::generic_pcdas_query(sql_query = "SELECT res_codigo_adotado AS cod_mun, res_RSAUDCOD AS cod_reg_saude FROM \"datasus-sim\" GROUP BY res_codigo_adotado, res_RSAUDCOD") %>%
  dplyr::mutate(
    cod_mun = as.numeric(cod_mun),
    cod_reg_saude = as.numeric(cod_reg_saude)
  ) %>%
  dplyr::filter(cod_reg_saude != 0)


usethis::use_data(mun_reg_saude, overwrite = TRUE, compress = "xz")
