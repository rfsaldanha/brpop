test_that("pop mun general is consistent", {
  res <- mun_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop mun male is consistent", {
  res <- mun_male_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop mun female is consistent", {
  res <- mun_female_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop mun general and per sex are the same", {
  res1 <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
    dplyr::group_by(mun, year, age_group) %>%
    dplyr::summarise(pop = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(mun, year, age_group, pop)

  res2 <- mun_pop %>%
    dplyr::arrange(mun, year, age_group, pop)

  expect_equal(res1$pop, res2$pop)
})
