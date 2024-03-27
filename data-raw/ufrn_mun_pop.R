## code to prepare `ufrn_mun_pop` dataset goes here

library(tidyverse)

ufrn_pop_raw <- readxl::read_xlsx(path = "data-raw/ufrn-dem/ProjMunic-2010_2030.xlsx")

ufrn_pop <- ufrn_pop_raw |>
  janitor::clean_names() |>
  select(-a_rmaior, -nome_munic, mun = armenor, year = ano) |>
  pivot_longer(cols = 4:23) |>
  rename(age_group = name, pop = value) |>
  mutate(age_group = case_match(
    age_group,
    "x0_a_5" ~ "From 0 to 4 years",
    "x5_a_10" ~ "From 5 to 9 years",
    "x10_a_15" ~ "From 10 to 14 years",
    "x15_a_20" ~ "From 15 to 19 years",
    "x20_a_25" ~ "From 20 to 24 years",
    "x25_a_30" ~ "From 25 to 29 years",
    "x30_a_35" ~ "From 30 to 34 years",
    "x35_a_40" ~ "From 35 to 39 years",
    "x40_a_45" ~ "From 40 to 44 years",
    "x45_a_50" ~ "From 45 to 49 years",
    "x50_a_55" ~ "From 50 to 54 years",
    "x55_a_60" ~ "From 55 to 59 years",
    "x60_a_65" ~ "From 60 to 64 years",
    "x65_a_70" ~ "From 65 to 69 year",
    "x70_a_75" ~ "From 70 to 74 years",
    "x75_a_80" ~ "From 75 to 79 years",
    "x80_a_85" ~ "From 80 to 84 years",
    "x85_a_90" ~ "From 85 to 89 years",
    "x90" ~ "From 90 years or more",
    "total" ~ "Total"
  )) |>
  relocate(mun) |>
  mutate(age_group = as.factor(age_group))

ufrn_pop_female <- ufrn_pop |>
  filter(sexo == "f") |>
  select(-sexo)

usethis::use_data(ufrn_pop_female, overwrite = TRUE, compress = "xz")

ufrn_pop_male <- ufrn_pop |>
  filter(sexo == "m") |>
  select(-sexo)

usethis::use_data(ufrn_pop_male, overwrite = TRUE, compress = "xz")
