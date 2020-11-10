
test_that("returns a ggplot", {
  expect_s3_class(plot_dots(), c("gg", "ggplot"))
})

test_that("fails when bad argument is passed", {
  expect_error(suppressWarnings(plot_dots("chr")))
  expect_error(plot_dots(-1L))
})

test_that("dots look good", {
  expect_snapshot_output(plot_dots(10L, size = 10L))
  expect_snapshot_output(plot_dots(color = "dodgerblue"))
})
