
#' @title Custom starfish date scale
#' @rdname scale_x_starfish_custom
#'
#' @param date_breaks defaults to 1 year
#' @param date_labels defaults to YYYY
#' @param ... further args passed
#'
#' @return a custom scale
#' @export
#'

scale_x_date_starfish <- function(date_breaks = "1 year",
                                  date_labels = "%Y",
                                  ...){

  scale_x <- ggplot2::scale_x_date(date_breaks = date_breaks,
                                   date_labels = date_labels,
                                   ...)
  scale_x
}


#' @rdname scale_x_starfish_custom
#' @export
scale_x_date_sf <- scale_x_date_starfish



#' Highlighting Covid timeframe in NH
#'
#' @param date1 default set
#' @param date2 default set
#' @param color default set
#' @param linetype default set
#' @param alpha default set
#'
#' @return a custom geom
#' @export
#'

geom_covid_starfish <- function(date1 = "2020-03-17",
                                date2 = "2021-12-01",
                                color = "grey30",
                                linetype = "dashed", alpha = 0.6) {
  list(
    ggplot2::geom_vline(ggplot2::aes(xintercept = lubridate::ymd(date1)),
               color = color, linetype = linetype, alpha = alpha),
    ggplot2::geom_vline(ggplot2::aes(xintercept = lubridate::ymd(date2)),
               color = color, linetype = linetype, alpha = alpha)
  )
}
