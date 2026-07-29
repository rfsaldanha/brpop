# Health region yearly female population estimate totals

This function provides a tibble containing female population estimates
for Brazilian health regions totals.

## Usage

``` r
regsaude_female_pop_totals(type = "standard", source = "datasus")
```

## Arguments

- type:

  character. 'standard' or 'reg_saude_449'

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).

## Value

A tibble.

## See also

[regsaude_female_pop](https://rfsaldanha.github.io/brpop/reference/regsaude_female_pop.md).
