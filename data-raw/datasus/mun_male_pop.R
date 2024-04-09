## code to prepare `mun_male_pop` dataset goes here

mun_male_pop_1 <- readr::read_csv2(file = "data-raw/mun_masc_1.csv", na = "-")
mun_male_pop_2 <- readr::read_csv2(file = "data-raw/mun_masc_2.csv", na = "-")
mun_male_pop_3 <- readr::read_csv2(file = "data-raw/mun_masc_3.csv", na = "-")

mun_male_pop <- dplyr::bind_rows(mun_male_pop_1, mun_male_pop_2)
mun_male_pop <- dplyr::bind_rows(mun_male_pop, mun_male_pop_3)

mun_male_pop <- tidyr::replace_na(data = mun_male_pop, replace = list("pop" = 0))

mun_male_pop$age_group <- stringr::str_replace(string = mun_male_pop$age_group, pattern = "De ", replacement = "From ")
mun_male_pop$age_group <- stringr::str_replace(string = mun_male_pop$age_group, pattern = " a ", replacement = " to ")
mun_male_pop$age_group <- stringr::str_replace(string = mun_male_pop$age_group, pattern = " anos", replacement = " years")
mun_male_pop$age_group <- stringr::str_replace(string = mun_male_pop$age_group, pattern = " ou mais", replacement = " or more")

# mun_male_pop$mun <- factor(x = mun_male_pop$mun)
# mun_male_pop$year <- factor(x = mun_male_pop$year, ordered = TRUE)
# mun_male_pop$age_group <- factor(x = mun_male_pop$age_group, levels = c("From 0 to 4 years",
#                                                                        "From 5 to 9 years",
#                                                                        "From 10 to 14 years",
#                                                                        "From 15 to 19 years",
#                                                                        "From 20 to 24 years",
#                                                                        "From 25 to 29 years",
#                                                                        "From 30 to 34 years",
#                                                                        "From 35 to 39 years",
#                                                                        "From 40 to 44 years",
#                                                                        "From 45 to 49 years",
#                                                                        "From 50 to 54 years",
#                                                                        "From 55 to 59 years",
#                                                                        "From 60 to 64 years",
#                                                                        "From 65 to 69 years",
#                                                                        "From 70 to 74 years",
#                                                                        "From 75 to 79 years",
#                                                                        "From 80 years or more",
#                                                                        "Total"), ordered = TRUE)
mun_male_pop$pop <- as.integer(mun_male_pop$pop)

usethis::use_data(mun_male_pop, overwrite = TRUE, compress = "xz")

