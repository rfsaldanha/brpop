## Resubmission

This is a resubmission of an archived package. Version 0.6.3 was archived on
2025-09-16 for a CRAN policy violation concerning Internet access.

The tests no longer make network requests. The compact IBGE dataset is now
bundled with the package, while functions that access the larger Zenodo-hosted
datasets catch download and read failures and return `NULL` with an informative
message. No examples, tests, or vignettes require Internet access during
`R CMD check`.

The release also updates the IBGE municipal population series through 2025.
Function signatures, defaults, existing source labels, and output column names
have been retained for backward compatibility.

## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new submission of a package archived on CRAN. The Internet-access
  policy issue recorded by CRAN is addressed above.
* The local check environment was unable to verify the current time. This is an
  environment-specific check and not a package problem.

## Test environments

* Local Ubuntu 24.04, R 4.3.3 (`R CMD check --as-cran --no-manual`)

The PDF manual was also generated successfully. The local TeX installation
lacks the system `texi2dvi` wrapper, so the manual was validated separately
with `pdflatex`; all Rd checks passed.
