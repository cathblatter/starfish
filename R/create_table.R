

#' Reverse engineer a table from its description from a SQL query
#'
#' @details
#' The table to create derives its name from the TABLE_NAME column and the columns from the
#' COLUMN_NAME column. Overall, the output comes from an Oracle DB
#'
#'
#'
#' @param tbl_name Table with holds the value with both the TABLE_NAME as
#' well as the COLUMN_NAME. See details and examples
#'
#' @return a tibble assigned to the GlobalEnv
#' @export
#'
#' @examples
#' # mockup table descritpion
#' (tbl_descr <- tibble::tibble(TABLE_NAME = c("my_table"),
#'                              COLUMN_NAME = c("var1", "var2", "var3")))
#' # now print the table
#' \dontrun{create_table(tbl_descr)}
create_table <- function(tbl_name) {
  tibble::as_tibble(base::sapply(tbl_name$COLUMN_NAME, \(x) character())) |>
    tibble::add_row() |>
    base::assign(tbl_name$TABLE_NAME[[1]], value = _, envir = .GlobalEnv)
}
