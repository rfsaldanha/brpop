library(tidyverse)
library(scales)

uf_ms <- uf_pop_totals(source = "bmh") |>
  mutate(source = "bmh")

uf_ufrn <- uf_pop_totals(source = "ufrn") |>
  mutate(source = "ufrn")

bind_rows(uf_ms, uf_ufrn) |>
  ggplot(aes(x = year, y = pop, color = source, group = source)) +
  geom_line(alpha = .5) +
  facet_wrap(~uf, scales = "free_y") +
  theme_bw()


mun_ms <- mun_pop_totals(source = "bmh") |>
  mutate(source = "bmh")

mun_ufrn <- mun_pop_totals(source = "ufrn") |>
  mutate(source = "ufrn") |>
  mutate(mun = as.numeric(substr(mun, 0, 6)))

bind_rows(mun_ms, mun_ufrn) |>
  filter(mun == 310620) |>
  ggplot(aes(x = year, y = pop, color = source, group = source)) +
  geom_line(alpha = .5)



bind_rows(mun_ms, mun_ufrn) |>
  filter(mun == 310620) |>
  View()
