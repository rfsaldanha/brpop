test_that("bmh regsaude_female_pop works", {
  res <- regsaude_female_pop(source = "bmh")

  expect_equal(143748, nrow(res))
})

test_that("ufrn regsaude_female_pop works", {
  res <- regsaude_female_pop(source = "ufrn")

  expect_equal(141540, nrow(res))
})

test_that("bmh regsaude_female_pop with reg saude 449 works", {
  res <- regsaude_female_pop(type = "reg_saude_449", source = "bmh")

  expect_equal(178200, nrow(res))
})

test_that("ufrn regsaude_female_pop with reg saude 449 works", {
  res <- regsaude_female_pop(type = "reg_saude_449", source = "ufrn")

  expect_equal(188580, nrow(res))
})


