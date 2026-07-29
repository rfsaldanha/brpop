# Health region yearly total population estimates

This function provides a tibble containing total population estimates
for Brazilian health regions.

## Usage

``` r
regsaude_pop_totals(type = "standard", source = "datasus")
```

## Arguments

- type:

  character. 'standard' or 'reg_saude_449'

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030), or
  `ibge` for IBGE data (2000 to 2025).

## Value

A tibble.

## See also

[regsaude_male_pop](https://rfsaldanha.github.io/brpop/reference/regsaude_male_pop.md),
[regsaude_female_pop](https://rfsaldanha.github.io/brpop/reference/regsaude_female_pop.md),
[ibge_pop](https://rfsaldanha.github.io/brpop/reference/ibge_pop.md).
