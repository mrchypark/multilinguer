# multilinguer <img src="man/figures/logo.png" align="right" height=140/>
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-6-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

<!-- badges: start -->
[![CRAN
status](https://www.r-pkg.org/badges/version/multilinguer)](https://CRAN.R-project.org/package=multilinguer)
[![R-CMD-check](https://github.com/mrchypark/multilinguer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mrchypark/multilinguer/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/mrchypark/multilinguer/branch/master/graph/badge.svg)](https://app.codecov.io/gh/mrchypark/multilinguer?branch=master)
<!-- badges: end -->

The goal of multilinguer is to provide install function
[corretto](https://aws.amazon.com/corretto/) which is one of distribution
of jdk and many others like conda for R user.

## Installation

You can install the multilinguer from
[cran](https://CRAN.R-project.org/package=multilinguer) with:

``` r
install.packages("multilinguer")
```

You can install the developing version of multilinguer from
[github](https://github.com/mrchypark/multilinguer) with:

``` r
remotes::install_github("mrchypark/multilinguer")
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
`install_java()` function request you MacOS password.

![](https://user-images.githubusercontent.com/6179259/73519641-fbbaa700-4444-11ea-9f52-5c3941040506.png)

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://blogik.netlify.app/"><img src="https://avatars.githubusercontent.com/u/26772420?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Seongik Kim</b></sub></a><br /><a href="#platform-SeongIkKim" title="Packaging/porting to new platform">📦</a></td>
    <td align="center"><a href="https://github.com/HeoJongWon"><img src="https://avatars.githubusercontent.com/u/37110949?v=4?s=100" width="100px;" alt=""/><br /><sub><b>HeoJongWon</b></sub></a><br /><a href="https://github.com/mrchypark/multilinguer/issues?q=author%3AHeoJongWon" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/jamesleeeee"><img src="https://avatars.githubusercontent.com/u/95525262?v=4?s=100" width="100px;" alt=""/><br /><sub><b>jamesleeeee</b></sub></a><br /><a href="https://github.com/mrchypark/multilinguer/commits?author=jamesleeeee" title="Tests">⚠️</a> <a href="https://github.com/mrchypark/multilinguer/issues?q=author%3Ajamesleeeee" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/Minseok-choi97"><img src="https://avatars.githubusercontent.com/u/80507582?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Minseok-choi97</b></sub></a><br /><a href="https://github.com/mrchypark/multilinguer/issues?q=author%3AMinseok-choi97" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://daeun-computer-uneasy.tistory.com/"><img src="https://avatars.githubusercontent.com/u/62705839?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Daeun Lee</b></sub></a><br /><a href="https://github.com/mrchypark/multilinguer/issues?q=author%3Adaeunni" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/bongho"><img src="https://avatars.githubusercontent.com/u/30528502?v=4?s=100" width="100px;" alt=""/><br /><sub><b>bono</b></sub></a><br /><a href="https://github.com/mrchypark/multilinguer/commits?author=bongho" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
