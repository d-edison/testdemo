
#' Count the Records of a Table in a Remote DB
#'
#' @param table_name The name of the table to count the records of
#' @param conn A DBI connection object
#'
#' @export
count_records <- function(table_name, conn) {
  DBI::dbGetQuery(conn, paste("SELECT COUNT(*) FROM", table_name))
}

#' Plot Some Dots
#'
#' @param n_dots Number of dots to plot
#' @param ... Additional argument passed on to \code{ggplot2::geom_point}
#'
#' @export
plot_dots <- function(n_dots = 100L, ...) {
  dat <- data.frame(
    x = rnorm(n_dots),
    y = rnorm(n_dots)
  )
  ggplot2::ggplot(dat, ggplot2::aes(x, y)) +
    ggplot2::geom_point(...)
}
