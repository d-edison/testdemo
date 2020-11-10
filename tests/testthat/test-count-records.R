
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

# you can test this way, but it hit the "DB" every time
test_that("returns an integer", {
  con <- DBI::dbConnect(RSQLite::SQLite(), dbname = ":memory:")
  DBI::dbWriteTable(con, "mtcars", mtcars)
  expect_true(is.integer(count_records("mtcars", con)))
  DBI::dbDisconnect(con)
})

# can we test this with mockery?
