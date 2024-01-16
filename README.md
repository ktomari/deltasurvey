
<!-- README.md is generated from README.Rmd. Please edit that file -->

# deltasurvey

<!-- badges: start -->
<!-- badges: end -->

The intent of this package is to aid data scientists in analyzing the
California Delta Residents Survey of 2023.

## Installation

At the time of this writing, there is no CRAN version, so must install
the development version of deltasurvey from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ktomari/deltasurvey")
```

## Example

First, we’ll need a sample from the data set.

``` r
data <- data.frame(
  DRS_ID = paste0("DRS", 2:6),
  Q2 = c("<I don't know>", rep("Historic or Delta \"legacy\" town", 4))
)
```

While this function is rarely called on its own, we’ll start by looking
at a component of the function that reads the data into the R
environment. This component allows the reading function to convert angle
bracketed values (eg. `"<Missing>"`) to `NA`.

``` r
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.2     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(deltasurvey)

drs_as_NA(data)
#>   DRS_ID                              Q2
#> 1   DRS2                            <NA>
#> 2   DRS3 Historic or Delta "legacy" town
#> 3   DRS4 Historic or Delta "legacy" town
#> 4   DRS5 Historic or Delta "legacy" town
#> 5   DRS6 Historic or Delta "legacy" town
```
