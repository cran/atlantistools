<!-- README.md is generated from README.Rmd. Please edit that file -->
atlantistools
=============

[![Project Status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/alketh/atlantistools.png?branch=master)](https://travis-ci.org/alketh/atlantistools) [![Build status](https://ci.appveyor.com/api/projects/status/github/alketh/atlantistools?branch=master&svg=true)](https://ci.appveyor.com/project/alketh/atlantistools) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/atlantistools)](https://cran.r-project.org/package=atlantistools) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/atlantistools)](https://cran.r-project.org/package=atlantistools) [![codecov](https://img.shields.io/codecov/c/github/alketh/atlantistools.svg)](https://codecov.io/github/alketh/atlantistools)

`atlantistools` is a data processing and visualisation tool for R, which helps to process output from Atlantis models within R. Using atlantistools makes sure that Atlantis users use the same input/output file structure which facilitates intra and inter model comparisons.

Installation
============

Install from CRAN:

``` r
install.packages("atlantistools")
```

Install the development version from Github using `devtools`.

``` r
# install.packages(devtools)
devtools::install_github("alketh/atlantistools")
```

It is highly recommended to install the package with the vignettes:

``` r
devtools::install_github("alketh/atlantistools", build_vignettes = TRUE)
vignette("package-demo", package = "atlantistools")
```

You can customise the build in vignettes to automate the simulate model - check output cycle during model calibration. Currently there are 4 vignettes available.

1.  model-preprocess.Rmd
2.  model-calibration.Rmd
3.  model-calibration-species.Rmd
4.  model-comparison.Rmd

In order to use the vignettes please make sure to use the latest version of RStudio (<https://www.rstudio.com/products/RStudio/>). In addition you need to install pandoc (<http://pandoc.org/installing.html>) and LaTex (I recommend MikTex, <http://miktex.org/download>) on your system. Depending on the LaTex package compendium you selected you might need to install the following additional LaTex packages to create pdfs: url, fancyvrb, framed and titling. You should be prompted in doing so when you try to create your first pdf.

The vignettes can be used one after another. In most cases you need to preprocess the output of your atlantis simulation first with *model-preprocess.Rmd*. You should save the output as an intermediate R-object to save time during model calibration. Afterwards you can knit the calibration vignettes to produce the summary pdf files.

``` r
library("knitr")
library("rmarkdown")

preprocessed <- T

if (preprocessed) {
  load("preprocess-north-sea.rda", verbose = T)
} else {
  render(input = "z:/R_codes/model-preprocess.Rmd", 
         output_file = "model-preprocess.html")
  save(result, file = "preprocess-north-sea.rda")
}

render(input = "z:/R_codes/model-calibration.Rmd", 
       output_file = "model-calibration-ns.pdf")

render(input = "z:/R_codes/model-calibration-species.Rmd", 
       output_file = "model-calibration-ns-species.pdf")
```
