# multilinguer <img src="man/figures/logo.png" align="right" height=140/>

<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/mrchypark/multilinguer/workflows/R-CMD-check/badge.svg)](https://github.com/mrchypark/multilinguer/actions)
[![CRAN status](https://www.r-pkg.org/badges/version/multilinguer)](https://CRAN.R-project.org/package=multilinguer)
[![runiverse-name](https://mrchypark.r-universe.dev/badges/:name)](https://mrchypark.r-universe.dev/)
[![runiverse-package](https://mrchypark.r-universe.dev/badges/multilinguer)](https://mrchypark.r-universe.dev/ui#packages)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/multilinguer)](https://cran.r-project.org/package=multilinguer)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/multilinguer)](https://cran.r-project.org/package=multilinguer)
<!-- badges: end -->

The goal of multilinguer is to provide install function
[corretto](https://aws.amazon.com/corretto/) which is one of distribution
of jdk and many others like conda for R user.

## Installation

``` r
# CRAN version
install.packages("multilinguer")

# dev version on r-universe
install.packages('multilinguer', repos = 'https://mrchypark.r-universe.dev')
```

## Example

Package has `install_*()` function.

``` r
library(multilinguer)
install_conda()
install_java()
```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://blogik.netlify.app/"><img src="https://avatars.githubusercontent.com/u/26772420?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Seongik Kim</b></sub></a><br /><a href="#platform-SeongIkKim" title="Packaging/porting to new platform">📦</a></td>
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
