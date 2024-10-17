## code to prepare `ibge_pop` dataset goes here

library(tidyverse)

# População residente, tabela SIDRA 202
# https://sidra.ibge.gov.br/Tabela/202
# 2000 e 2010
tab202 <- read_csv2(file = "data-raw/ibge/tabela202.csv", na = "...")

# População residente, tabela SIDRA 793
# https://sidra.ibge.gov.br/Tabela/793
# 2007
tab793 <- read_csv2(file = "data-raw/ibge/tabela793.csv", na = "...")

# Estimativas de população, tabela SIDRA 6579. Atualizada em 24/06/2024
# https://sidra.ibge.gov.br/Tabela/6579
# 2001 a 2006, 2008 a 2009, 2011 a 2021
tab6579 <- read_csv2(file = "data-raw/ibge/tabela6579_v2.csv", na = "...")

# População residente, tabela SIDRA 9514
# https://sidra.ibge.gov.br/Tabela/9514
# 2022
tab9514 <- read_csv2(file = "data-raw/ibge/tabela9514.csv", na = "...")

# População residente, TCU 2023
tab_tcu_2023 <- read_csv2(file = "data-raw/ibge/POP_TCU_2023_Municipios_POP2022_Malha2023.csv")

# População residente, DOU 2024
tab_dou_2024 <- read_csv2(file = "data-raw/ibge/estimativa_dou_2024.csv")


ibge_pop <- full_join(tab202, tab793, by = "code_muni") |>
  full_join(tab6579, by = "code_muni") |>
  full_join(tab9514, by = "code_muni") |>
  full_join(tab_tcu_2023, by = "code_muni") |>
  full_join(tab_dou_2024, by = "code_muni") |>
  pivot_longer(cols = 2:26, names_to = "year", values_to = "pop") |>
  mutate(year = as.numeric(year))

usethis::use_data(ibge_pop, overwrite = TRUE, compress = "xz")
