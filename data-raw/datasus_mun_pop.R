## code to prepare `datasus_mun_pop` dataset goes here

load(file = "data-raw/datasus/mun_female_pop.rda")

datasus_mun_female_pop <- mun_female_pop

usethis::use_data(datasus_mun_female_pop, overwrite = TRUE, compress = "xz")

load(file = "data-raw/datasus/mun_male_pop.rda")

datasus_mun_male_pop <- mun_male_pop

usethis::use_data(datasus_mun_male_pop, overwrite = TRUE, compress = "xz")
