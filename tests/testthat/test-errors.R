wrong <- TRUE

test_that("regsaude_female_pop error", {
  expect_error(regsaude_female_pop(type = wrong))
})

test_that("regsaude_male_pop error", {
  expect_error(regsaude_male_pop(type = wrong))
})
