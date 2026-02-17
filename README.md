# patRoonDataIMS

This R package contains example raw LC-IMS-HRMS data to test and demonstrate the [patRoon R package][patRoon].

This data package contains

* a triplicate analysis of a blank solvent (useful for blank subtraction)
* a triplicate analysis of a standard mixture containing a wide range of polar contaminants.

The data was acquired in positive and neagtive ionization mode.

## Installation

You can install patRoonData from github with:

``` r
install.packages("remotes")
remotes::install_github("rickhelmus/patRoonDataIMS")
```

> **_NOTE_**: The actual data files (~1.5GB) are downloaded during the package installation, hence, a stable internet connection is required during installation.

## More information

Please see the [patRoon web page][patRoon-web] and the [patRoonData] package for LC-HRMS demo data.


[patRoon]: https://github.com/rickhelmus/patRoon
[patRoon-web]: https://rickhelmus.github.io/patRoon/
[patRoonData]: https://github.com/rickhelmus/patRoonData