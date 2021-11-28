
<!-- README.md is generated from README.Rmd. Please edit that file -->

# multilinguer <img src="man/figures/logo.png" align="right" height=140/>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/multilinguer)](https://CRAN.R-project.org/package=multilinguer)
[![R-CMD-check](https://github.com/mrchypark/multilinguer/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/mrchypark/multilinguer/actions/workflows/check-standard.yaml)
[![Codecov test
coverage](https://codecov.io/gh/mrchypark/multilinguer/branch/master/graph/badge.svg)](https://app.codecov.io/gh/mrchypark/multilinguer?branch=master)
<!-- badges: end -->

The goal of multilinguer is to provide install function
[correto](https://aws.amazon.com/corretto/) which is one of distribution
of jdk and many others like conda for R user.

## Installation

You can install the multilinguer from
[cran](https://CRAN.R-project.org/package=multilinguer) with:

``` r
install.packages("multilinguer")
```

You can install the developing version of multilinguer from
[gitlab](https://gitlab.com/mrchypark/multilinguer) with:

``` r
remotes::install_gitlab("mrchypark/multilinguer")
```

## Example

Package has `install_*()` function.

``` r
library(multilinguer)
install_conda()
install_java()
```

## java for mac

rJava package on MacOS, only work with Administrator privileges. So
install\_java() function request you MacOS password.

![](https://user-images.githubusercontent.com/6179259/73519641-fbbaa700-4444-11ea-9f52-5c3941040506.png)
