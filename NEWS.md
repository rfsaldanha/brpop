# brpop 0.5.0
* Move data files to Zenodo and use {zendown} package to handle file download. This will keep the package smaller for future CRAN versions.

# brpop 0.4.1
* Add IBGE population estimates for 2023 and 2024.

# brpop 0.4.0
* Add population estimates from the UFRN-PPGDem-LEPP (2010 to 2030) for sex and age groups.
* Add total municipality population from IBGE estimates, Census and Population Inquiries (2000 to 2022).
* Adopt `dtplyr` for faster computations.
* Documentation revision.
* Function names revision.

# brpop 0.3.0
* Bug correction on `mun_reg_saude`: remove duplicated records.
* Add arguments to `reg_saude_*` functions to use the 449 units health region version.

# brpop 0.2.0
* Bug correction on `uf_pop_totals` and `regsaude_pop_totals`.

# brpop 0.1.7
* Bug correction on `mun_pop_totals`. Thanks to @filipemsc!

# brpop 0.1.6
* New function for health region and sex (`regsaude_sex_pop`) and small bug fixes.

# brpop 0.1.5
* Variables types modification.

# brpop 0.1.4
* Bug correction: remove total records from sum on total functions.

# brpop 0.1.3
* Add functions for male and female population totals.

# brpop 0.1.2
* Add functions for health regions population estimatives.

# brpop 0.1.1
* Add functions for UF and municipalities population totals.

# brpop 0.1.0
* First release of the package.
