test_that("remote dataset loaders return NULL after a handled failure", {
  testthat::local_mocked_bindings(
    .zenodo_data = function(file_name) NULL,
    .package = "brpop"
  )

  loaders <- list(
    datasus_mun_male_pop,
    datasus_mun_female_pop,
    datasus2024_mun_male_pop,
    datasus2024_mun_female_pop,
    ufrn_mun_male_pop,
    ufrn_mun_female_pop
  )

  for (loader in loaders) {
    expect_null(loader())
  }
})

test_that("downstream functions propagate handled download failures", {
  mock_population_loaders(male = NULL, female = NULL)

  expect_null(mun_pop_totals())
  expect_null(mun_pop_age())
  expect_null(mun_sex_pop())
  expect_null(uf_pop_totals())
  expect_null(uf_pop_age())
  expect_null(uf_sex_pop())
  expect_null(regsaude_pop_totals())
  expect_null(regsaude_pop_age())
  expect_null(regsaude_sex_pop())
})
