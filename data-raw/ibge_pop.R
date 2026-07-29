## Code to prepare the `ibge_pop` dataset.

# População residente, tabela SIDRA 202
# https://sidra.ibge.gov.br/Tabela/202
# 2000 e 2010
tab202 <- readr::read_csv2(
  file = "data-raw/ibge/tabela202.csv",
  na = "...",
  show_col_types = FALSE
)

# População residente, tabela SIDRA 793
# https://sidra.ibge.gov.br/Tabela/793
# 2007
tab793 <- readr::read_csv2(
  file = "data-raw/ibge/tabela793.csv",
  na = "...",
  show_col_types = FALSE
)

# Estimativas de população, tabela SIDRA 6579. Atualizada em 24/06/2024
# https://sidra.ibge.gov.br/Tabela/6579
# 2001 a 2006, 2008 a 2009, 2011 a 2021
tab6579 <- readr::read_csv2(
  file = "data-raw/ibge/tabela6579_v2.csv",
  na = "...",
  show_col_types = FALSE
)

# População residente, tabela SIDRA 9514
# https://sidra.ibge.gov.br/Tabela/9514
# 2022
tab9514 <- readr::read_csv2(
  file = "data-raw/ibge/tabela9514.csv",
  na = "...",
  show_col_types = FALSE
)

# População residente, TCU 2023
tab_tcu_2023 <- readr::read_csv2(
  file = "data-raw/ibge/POP_TCU_2023_Municipios_POP2022_Malha2023.csv",
  show_col_types = FALSE
)

# População residente, DOU 2024
tab_dou_2024 <- readr::read_csv2(
  file = "data-raw/ibge/estimativa_dou_2024.csv",
  show_col_types = FALSE
)

# Estimativas municipais de 2025 enviadas ao TCU, revisão de 13/01/2026.
# https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2025/
tab_tcu_2025_raw <- suppressMessages(
  readxl::read_excel(
    path = "data-raw/ibge/POP2025_20260113.xls",
    sheet = "Municípios",
    col_names = FALSE,
    col_types = "text"
  )
)

municipality_rows <- grepl("^[0-9]{2}$", tab_tcu_2025_raw[[2]]) &
  grepl("^[0-9]{5}$", tab_tcu_2025_raw[[3]]) &
  grepl("^[0-9]+$", tab_tcu_2025_raw[[5]])

tab_tcu_2025 <- tibble::tibble(
  code_muni = as.numeric(paste0(
    tab_tcu_2025_raw[[2]][municipality_rows],
    tab_tcu_2025_raw[[3]][municipality_rows]
  )),
  `2025` = as.numeric(tab_tcu_2025_raw[[5]][municipality_rows])
)

# Fail loudly if the official workbook layout or contents change unexpectedly.
stopifnot(
  nrow(tab_tcu_2025) == 5571L,
  dplyr::n_distinct(tab_tcu_2025$code_muni) == 5571L,
  sum(tab_tcu_2025$`2025`) == 213421037
)

readr::write_csv2(
  tab_tcu_2025,
  file = "data-raw/ibge/estimativa_tcu_2025.csv"
)

ibge_pop_2000_2024 <- dplyr::full_join(tab202, tab793, by = "code_muni") |>
  dplyr::full_join(tab6579, by = "code_muni") |>
  dplyr::full_join(tab9514, by = "code_muni") |>
  dplyr::full_join(tab_tcu_2023, by = "code_muni") |>
  dplyr::full_join(tab_dou_2024, by = "code_muni") |>
  tidyr::pivot_longer(
    cols = -code_muni,
    names_to = "year",
    values_to = "pop"
  ) |>
  dplyr::mutate(year = as.numeric(year))

ibge_pop_data <- dplyr::bind_rows(
  ibge_pop_2000_2024,
  dplyr::transmute(tab_tcu_2025, code_muni, year = 2025, pop = `2025`)
)

dir.create("inst/extdata", recursive = TRUE, showWarnings = FALSE)

saveRDS(
  object = ibge_pop_data,
  file = "data-raw/ibge_pop.rds",
  compress = "xz"
)
saveRDS(
  object = ibge_pop_data,
  file = "inst/extdata/ibge_pop.rds",
  compress = "xz"
)
