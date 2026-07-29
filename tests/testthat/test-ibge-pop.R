test_that("bundled IBGE data retain the established contract", {
  x <- ibge_pop()

  expect_s3_class(x, "tbl_df")
  expect_identical(names(x), c("code_muni", "year", "pop"))
  expect_type(x$code_muni, "double")
  expect_type(x$year, "double")
  expect_type(x$pop, "double")
  expect_identical(sort(unique(x$year)), as.numeric(2000:2025))

  historical <- x[x$year <= 2024, ]
  expect_equal(nrow(historical), 139275)
})

test_that("2025 IBGE estimates match the official revised workbook", {
  x <- ibge_pop()
  x_2025 <- x[x$year == 2025, ]

  expect_equal(nrow(x_2025), 5571)
  expect_false(anyNA(x_2025$pop))
  expect_equal(sum(x_2025$pop), 213421037)
  expect_equal(
    x_2025$pop[x_2025$code_muni == 5101837],
    5877
  )
})

test_that("IBGE aggregations include 2025 without missing geography", {
  municipal <- mun_pop_totals(source = "ibge")
  uf <- uf_pop_totals(source = "ibge")
  region <- regsaude_pop_totals(type = "reg_saude_449", source = "ibge")

  expect_identical(municipal, ibge_pop())

  uf_2025 <- uf[uf$year == 2025, ]
  expect_equal(nrow(uf_2025), 27)
  expect_equal(sum(uf_2025$pop), 213421037)

  region_2025 <- region[region$year == 2025, ]
  expect_false(anyNA(region_2025$codi_reg_saude))
  expect_equal(nrow(region_2025), 449)
  expect_equal(sum(region_2025$pop), 213421037)
})

test_that("Boa Esperança do Norte maps to Teles Pires", {
  expect_equal(
    mun_reg_saude$codi_reg_saude[mun_reg_saude$code_muni == 510183],
    5114
  )
  expect_equal(
    mun_reg_saude_449$codi_reg_saude[
      mun_reg_saude_449$code_muni == 510183
    ],
    51014
  )
})
