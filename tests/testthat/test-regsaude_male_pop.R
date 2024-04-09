test_that("datasus regsaude_male_pop works", {
  res <- regsaude_male_pop(source = "datasus")

  expect_equal(143748, nrow(res))
})

test_that("ufrn regsaude_male_pop works", {
  res <- regsaude_male_pop(source = "ufrn")

  expect_equal(141540, nrow(res))
})

test_that("datasus regsaude_male_pop with reg saude 449 works", {
  res <- regsaude_male_pop(type = "reg_saude_449", source = "datasus")

  expect_equal(178200, nrow(res))
})

test_that("ufrn regsaude_male_pop with reg saude 449 works", {
  res <- regsaude_male_pop(type = "reg_saude_449", source = "ufrn")

  expect_equal(188580, nrow(res))
})


