test_that("existing function signatures and defaults are retained", {
  expect_identical(
    as.list(formals(mun_pop_totals)),
    list(source = "datasus")
  )
  expect_identical(
    as.list(formals(mun_pop_age)),
    list(source = "datasus", sex = "all")
  )
  expect_identical(
    as.list(formals(regsaude_pop_totals)),
    list(type = "standard", source = "datasus")
  )
  expect_identical(
    as.list(formals(regsaude_pop_age)),
    list(type = "standard", source = "datasus", sex = "all")
  )
})

test_that("municipality and UF transformations work with local fixtures", {
  mock_population_loaders()

  totals <- mun_pop_totals(source = "datasus")
  by_age <- mun_pop_age(source = "datasus")
  by_sex <- mun_sex_pop(source = "datasus")
  uf_totals <- uf_pop_totals(source = "datasus")

  expect_identical(names(totals), c("code_muni", "year", "pop"))
  expect_equal(totals$pop, c(210, 410))
  expect_identical(names(by_age), c("code_muni", "year", "age_group", "pop"))
  expect_equal(sum(by_age$pop[by_age$age_group == "Total"]), 620)
  expect_identical(names(by_sex), c("code_muni", "year", "age_group", "pop", "sex"))
  expect_setequal(unique(by_sex$sex), c("Male", "Female"))
  expect_identical(names(uf_totals), c("uf", "year", "pop"))
  expect_equal(uf_totals$pop, 620)
})

test_that("health-region transformations work with both lookup contracts", {
  mock_population_loaders()

  standard <- regsaude_pop_totals(source = "datasus")
  regions_449 <- regsaude_pop_totals(
    type = "reg_saude_449",
    source = "datasus"
  )
  revised <- regsaude_pop_totals(
    type = "reg_saude_449",
    source = "datasus2024"
  )
  by_sex <- regsaude_sex_pop(source = "datasus")

  expect_identical(names(standard), c("codi_reg_saude", "year", "pop"))
  expect_equal(standard$pop, 620)
  expect_identical(names(regions_449), c("codi_reg_saude", "year", "pop"))
  expect_equal(regions_449$pop, 620)
  expect_equal(revised$pop, 620)
  expect_identical(
    names(by_sex),
    c("codi_reg_saude", "year", "age_group", "pop", "sex")
  )
})

test_that("invalid legacy arguments still fail clearly", {
  expect_error(mun_pop_totals(source = "invalid"))
  expect_error(regsaude_female_pop(type = TRUE))
  expect_error(regsaude_male_pop(type = TRUE))
})
