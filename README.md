
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis build status](https://travis-ci.org/ThinkR-open/attachment.svg?branch=master)](https://travis-ci.org/ThinkR-open/attachment)

attachment
==========

The goal of attachment is to help to deal with package dependencies during package development.

When building a package, we have to add `@importFrom` in our documentation and don't forget to add the list of dependencies in the "Imports" or "Suggests" package lists in the DESCRIPTION file.

Why do you have to repeat twice the same thing ?
And what happens when you remove a dependency for one of your functions ? Do you really want to run a "Find in files" to verify that you do not need this package anymore ?

Let {attachment} help you ! This reads your NAMESPACE and your vignettes and update the DESCRIPTION file for you. Are you ready to be lazy ?

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("ThinkR-open/attachment")
```

Use package {attachment}
------------------------

``` r
library(attachment)
```

What you really want is to fill and update your description file along with the modifications of your documentation. Indeed, only this function will really be called in your package:

``` r
attachment::att_to_description()
```

Vignette
--------

There is also a vignette in this package.

``` r
vignette("fill-pkg-description", package = "attachment")
```

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.