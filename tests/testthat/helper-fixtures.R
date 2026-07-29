male_fixture <- tibble::tibble(
  code_muni = rep(c(110002, 110013), each = 2),
  year = 2020,
  age_group = rep(c("0 to 4", "Total"), 2),
  pop = c(10, 100, 20, 200)
)

female_fixture <- tibble::tibble(
  code_muni = rep(c(110002, 110013), each = 2),
  year = 2020,
  age_group = rep(c("0 to 4", "Total"), 2),
  pop = c(11, 110, 21, 210)
)

mock_population_loaders <- function(male = male_fixture, female = female_fixture) {
  testthat::local_mocked_bindings(
    datasus_mun_male_pop = function() male,
    datasus_mun_female_pop = function() female,
    datasus2024_mun_male_pop = function() {
      dplyr::mutate(male, code_muni = code_muni * 10 + 5)
    },
    datasus2024_mun_female_pop = function() {
      dplyr::mutate(female, code_muni = code_muni * 10 + 5)
    },
    ufrn_mun_male_pop = function() {
      dplyr::mutate(male, code_muni = code_muni * 10 + 5)
    },
    ufrn_mun_female_pop = function() {
      dplyr::mutate(female, code_muni = code_muni * 10 + 5)
    },
    .package = "brpop",
    .env = parent.frame()
  )
}
