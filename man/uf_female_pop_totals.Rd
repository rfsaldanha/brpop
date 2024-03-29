% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uf_female_pop_totals.R
\name{uf_female_pop_totals}
\alias{uf_female_pop_totals}
\title{UF yearly female population estimates totals}
\usage{
uf_female_pop_totals()
}
\value{
A tibble.
}
\description{
This function provides a tibble containing female population estimates for Brazilian UFs ("Unidades Federativas") totals from 2000 to 2021.
}
\details{
The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.

\describe{
\item{uf}{UF 2 digits code}
\item{year}{year of the estimative}
\item{pop}{population estimative}
}
}
\seealso{
\link{uf_female_pop}.
}
