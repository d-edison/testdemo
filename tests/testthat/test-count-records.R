
library(mockery)

get_name <- function(name) name
say_introduction <- function(name) paste("Hello, my name is", get_name(name))

test_that("demonstrate stubbing", {
  # replaces get_name with a function that always returns David
  # but only when called from say_introduction
  David <- mock("David")
  stub(say_introduction, "get_name", David)
  expect_equal(say_introduction("Jon"), "Hello, my name is David")
  expect_called(David, 1)
})

# We did it!
test_that("returns an integer", {
  stub(count_records, "DBI::dbGetQuery", 5L)
  expect_true(is.integer(count_records("mtcars", con)))
})
