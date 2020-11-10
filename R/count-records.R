
#' Count the Records of a Table in a Remote DB
#'
#' @param table_name The name of the table to count the records of
#' @param conn A DBI connection object
#'
#' @export
count_records <- function(table_name, conn) {
  DBI::dbGetQuery(conn, paste("SELECT COUNT(*) FROM", table_name))[[1]]
}
