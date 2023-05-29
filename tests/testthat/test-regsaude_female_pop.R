test_that("regsaude_female_pop works", {
  res <- regsaude_female_pop()

  expect_equal(143748, nrow(res))
})

test_that("regsaude_female_pop with reg saude 449 works", {
  res <- regsaude_female_pop(type = "reg_saude_449")

  expect_equal(178200, nrow(res))
})

test_that("regsaude_female_pop error", {
  expect_error(regsaude_female_pop(type = "blabla"))
})
