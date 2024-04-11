wrong <- TRUE

test_that("regsaude_female_pop error", {
  skip_on_cran()
  expect_error(regsaude_female_pop(type = wrong))
})

test_that("regsaude_male_pop error", {
  skip_on_cran()
  expect_error(regsaude_male_pop(type = wrong))
})
