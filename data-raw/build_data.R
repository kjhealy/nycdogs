## Build data objects

# Remove all .rda files in data/ and regenerate them
fs::dir_ls(here::here("data"), glob = "*.rda") |> fs::file_delete()

# Build data objects
source(here::here("data-raw", "nyc_bites.R"))
source(here::here("data-raw", "nyc_license.R"))

# Documentation in _documentation isn't generated automatically. If the data
# changes, errors are found, or check() detects inconsistencies the
# documentation should be updated manually.
source(here::here("data-raw", "build_docs.R"))
