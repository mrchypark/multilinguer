
<!-- README.md is generated from README.Rmd. Please edit that file -->

# multilinguer

<!-- badges: start -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mrchypark/multilinguer?branch=master&svg=true)](https://ci.appveyor.com/project/mrchypark/multilinguer)
[![Travis build
status](https://travis-ci.org/mrchypark/multilinguer.svg?branch=master)](https://travis-ci.org/mrchypark/multilinguer)
[![Codecov test
coverage](https://codecov.io/gh/mrchypark/multilinguer/branch/master/graph/badge.svg)](https://codecov.io/gh/mrchypark/multilinguer?branch=master)
<!-- badges: end -->

The goal of multilinguer is to provide install function
[correto](https://aws.amazon.com/en/corretto/) which is one of
distribution of jdk and many others like conda for R user.

## Installation

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
