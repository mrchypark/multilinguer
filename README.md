
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

The goal of multilinguer is to provide install function of [Amazon
Correto](https://docs.aws.amazon.com/ko_kr/corretto/latest/corretto-8-ug/downloads-list.html)
which is one of openjdk and
[Anaconda](https://docs.anaconda.com/anaconda/install/silent-mode/)
which is one of distribution of python installer and env.

## Installation

You can install the developing version of multilinguer from
[github](https://github.com/mrchypark/multilinguer) with:

``` r
remotes::install_github("mrchypark/multilinguer")
```

## Example

Package has `set()` function.

``` r
library(multilinguer)
set("java")
set_java()
```
