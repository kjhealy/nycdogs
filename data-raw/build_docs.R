## Concatenate data-raw/_documentation/*.R files into R/data.R

doc_files <- fs::dir_ls(
  here::here("data-raw", "_documentation"),
  regexp = "\\.R$"
)

doc_content <- doc_files |>
  purrr::map(readLines) |>
  purrr::map(\(x) c(x, "")) |>
  unlist()

writeLines(
  doc_content,
  here::here("R", "data.R")
)
