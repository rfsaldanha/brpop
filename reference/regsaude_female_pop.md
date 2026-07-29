# Health region yearly female population estimates per age group

This function provides a tibble containing female population estimates
for Brazilian health regions by age group.

## Usage

``` r
regsaude_female_pop(type = "standard", source = "datasus")
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

[datasus_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_female_pop.md),
[ufrn_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_female_pop.md).
