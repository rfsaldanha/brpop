## code to prepare `bmh_mun_pop` dataset goes here

load(file = "data-raw/bhm/mun_female_pop.rda")

bmh_mun_female_pop <- mun_female_pop

usethis::use_data(bmh_mun_female_pop, overwrite = TRUE, compress = "xz")

load(file = "data-raw/bhm/mun_male_pop.rda")

bmh_mun_male_pop <- mun_male_pop

usethis::use_data(bmh_mun_male_pop, overwrite = TRUE, compress = "xz")
