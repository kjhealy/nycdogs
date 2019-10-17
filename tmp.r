library(here)
library(usethis)

use_mit_license("Kieran Healy")

use_package("sf", "Suggests")
use_package("dplyr", "Suggests")
use_readme_rmd()

load("data/nyc_license.rda")
load("data/nyc_zips.rda")
load("data/nyc_bites.rda")


use_data(nyc_license, nyc_zips, nyc_bites)

use_git()
