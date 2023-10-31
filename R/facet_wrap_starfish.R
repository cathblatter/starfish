
#' STARFISH customized facets with units on right side
#'
#' @param facets defaults to variable anon_unit
#' @param ncol defaults to 1
#' @param nrow defaults to NULL
#' @param strip.position "right"
#' @param drop default: TRUE
#' @param scales default: fixed
#' @param shrink default fixed
#' @param labeller "label_value"
#' @param as.table TRUE
#' @param switch NULL
#' @param dir "h"
#' @param ... to pass to \code{ggplot2::facet_wrap}
#'
#' @return a facet
#' @export
#'
facet_wrap_starfish <- function(facets = ~anon_unit,
                                ncol = 1,
                                nrow = NULL,
                                strip.position = "right",
                                drop = TRUE,
                                scales = "fixed",
                                shrink = TRUE,
                                labeller = "label_value",
                                as.table = TRUE,
                                switch = NULL,
                                dir = "h",
                                ...){

  facet <- ggplot2::facet_wrap(facets, ncol = ncol, nrow = nrow, strip.position = strip.position, scales = scales,
                      shrink = shrink, labeller = labeller, as.table = as.table,
                      switch = switch, drop = drop, dir = dir, ...)
  facet$facet$facet_params$strip.position <- ifelse(dir == "h", "bottom", "left")
  facet

  }
