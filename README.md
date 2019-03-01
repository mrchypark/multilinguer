# multilinguer

The goal of multilinguer is to provide install function of [Amazon Correto](https://docs.aws.amazon.com/ko_kr/corretto/latest/corretto-8-ug/downloads-list.html) which is one of openjdk and [Anaconda](https://docs.anaconda.com/anaconda/install/silent-mode/) which is one of distribution of python installer and env.

## Installation

You can install the developing version of multilinguer from [github](https://github.com/mrchypark/multilinguer) with:

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

