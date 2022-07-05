test_that("pop uf general is consistent", {
  res <- uf_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop uf male is consistent", {
  res <- uf_male_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop uf female is consistent", {
  res <- uf_female_pop %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("pop uf general and per sex are the same", {
  res1 <- dplyr::bind_rows(uf_male_pop, uf_female_pop) %>%
    dplyr::group_by(uf, year, age_group) %>%
    dplyr::summarise(pop = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(uf, year, age_group, pop)

  res2 <- uf_pop %>%
    dplyr::arrange(uf, year, age_group, pop)

  expect_equal(res1$pop, res2$pop)
})
