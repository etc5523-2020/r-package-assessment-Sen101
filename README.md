
<!-- README.md is generated from README.Rmd. Please edit that file -->

# COVIDsen

<!-- badges: start -->

<!-- badges: end -->

The goal of COVIDsen is to show the global COVID-19 epidemic situation

## Installation

You can install the released version of COVIDsen from
[GitHub](https://github.com/etc5523-2020/r-package-assessment-Sen101)
with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-Sen101")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(COVIDsen)
library(tibble)
## basic example code
covid
#> # A tibble: 717,375 x 8
#>    `Country/Region` `Province/State` Latitude Longitude Confirmed Recovered
#>    <chr>            <chr>               <dbl>     <dbl>     <dbl>     <dbl>
#>  1 China            Anhui                31.8      117.         1        NA
#>  2 China            Beijing              40.2      116.        14        NA
#>  3 China            Chongqing            30.1      108.         6        NA
#>  4 China            Fujian               26.1      118.         1        NA
#>  5 China            Gansu                35.8      104.        NA        NA
#>  6 China            Guangdong            23.3      113.        26        NA
#>  7 China            Guangxi              23.8      109.         2        NA
#>  8 China            Guizhou              26.8      107.         1        NA
#>  9 China            Hainan               19.2      110.         4        NA
#> 10 China            Hebei                37.9      115.         1        NA
#> # ... with 717,365 more rows, and 2 more variables: Deaths <dbl>, Date <date>
```
