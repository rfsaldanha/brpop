test_that("regsaude_male_pop works", {
  res <- regsaude_male_pop()

  expect_equal(143748, nrow(res))
})

test_that("regsaude_male_pop with reg saude 449 works", {
  res <- regsaude_male_pop(type = "reg_saude_449")

  expect_equal(178200, nrow(res))
})

test_that("regsaude_male_pop error", {
  expect_error(regsaude_male_pop(type = "blabla"))
})
