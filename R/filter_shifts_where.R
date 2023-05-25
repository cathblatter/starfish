#' Filter all shifts where a certain condition is met
#'
#' @param .data
#' @param ... condition to pass to dplyr::filter
#'
#' @return a dataframe containing all shift-entries where a condition is met
#' @export
#'
#' @examples
filter_shifts_where <- function(.data, ..., shift_var = shift_id){

  shift_id <- NULL

  shifts <- dplyr::filter(.data, ...) |> dplyr::pull({{shift_var}}) |> base::unique()

  .data |>
    dplyr::filter({{shift_var}} %in% shifts)

}
