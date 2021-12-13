cat_file <- function(...) {
  cat(brio::read_file(file.path(...)))
}

test_that("Snapshot test of knitr-engine", {
  input <- file.path("../data/test.Rmd")
  output <- withr::local_file("snapshot_knitr_test.md")

  knitr::knit(input, output)
  expect_snapshot(cat_file(output))
})
