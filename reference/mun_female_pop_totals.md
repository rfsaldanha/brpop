# Municipality yearly female population estimate totals

This function provides a tibble containing female population estimates
for Brazilian municipalities totals.

## Usage

``` r
mun_female_pop_totals(source = "datasus")
```

## Arguments

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).

## Value

A tibble.

## See also

[datasus_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_female_pop.md),
[ufrn_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_female_pop.md).
