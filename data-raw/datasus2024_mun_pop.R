## code to prepare `datasus2024` dataset goes here

library(tidyverse)
library(foreign)

# Read files
files <- list.files(path = "data-raw/datasus2024/FTP/", pattern = ".dbf", full.names = TRUE)

pop_raw <- tibble()
for (f in files){
  message(f)
  tmp <- read.dbf(file = f)
  pop_raw <- bind_rows(pop_raw, tmp)
  rm(tmp)
}
rm(f)
rm(files)

# Format
pop <- pop_raw |>
  rename(
    codmun = COD_MUN,
    year = ANO,
    sex = SEXO,
    age = IDADE,
    pop = POP
  ) |>
  mutate(
    codmun = as.numeric(as.character(codmun)),
    year = as.numeric(as.character(year)),
    sex = as.character(sex),
    age = as.numeric(as.character(age))
  ) |>
  mutate(
    age_group = case_when(
      age >= 0 & age <= 4 ~ "From 0 to 4 years",
      age >= 5 & age <= 9 ~ "From 5 to 9 years",
      age >= 10 & age <= 14 ~ "From 10 to 14 years",
      age >= 15 & age <= 19 ~ "From 15 to 19 years",
      age >= 20 & age <= 24 ~ "From 20 to 24 years",
      age >= 25 & age <= 29 ~ "From 25 to 29 years",
      age >= 30 & age <= 34 ~ "From 30 to 34 years",
      age >= 35 & age <= 39 ~ "From 35 to 39 years",
      age >= 40 & age <= 44 ~ "From 40 to 44 years",
      age >= 45 & age <= 49 ~ "From 45 to 49 years",
      age >= 50 & age <= 54 ~ "From 50 to 54 years",
      age >= 55 & age <= 59 ~ "From 55 to 59 years",
      age >= 60 & age <= 64 ~ "From 60 to 64 years",
      age >= 65 & age <= 69 ~ "From 65 to 69 years",
      age >= 70 & age <= 74 ~ "From 70 to 74 years",
      age >= 75 & age <= 79 ~ "From 75 to 79 years",
      age >= 80 ~ "From 80 years or more",
      .default = NA
    )
  ) |>
  group_by(codmun, year, sex, age_group) |>
  summarise(pop = sum(pop, na.rm = TRUE)) |>
  ungroup()

rm(pop_raw)

pop_totals <- pop |>
  group_by(codmun, year, sex, pop) |>
  summarise(pop = sum(pop, na.rm = TRUE)) |>
  ungroup() |>
  mutate(age_group = "Total")

pop <- bind_rows(pop, pop_totals)

pop_male <- filter(pop, sex == 1) |>
  select(-sex)

pop_female <- filter(pop, sex == 2) |>
  select(-sex)

rm(pop)


saveRDS(
  object = pop_male,
  file = "data-raw/datasus2024_mun_male_pop.rds",
  compress = "xz"
)

saveRDS(
  object = pop_female,
  file = "data-raw/datasus2024_mun_female_pop.rds",
  compress = "xz"
)

