#' STARFISH ggplot theme
#'
#' [ggplot2] plot theme based on...
#'
#' @param base_theme A base theme upon which additional theme-specific options are applied
#' @param ... Fruther arguments passed to \code{ggplot2::theme()}
#'
#' @references https://github.com/gadenbuie/ggpomological/blob/master/R/theme_pomological.R
#' @seealso [ggplot2::theme]
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' data <- data.frame(x = 1:10, y = 1:10)
#' ggplot(data, aes(x, y)) + geom_point() + theme_starfish()
#' }
#'
#'
#' @export
theme_starfish <- function(base_theme = ggplot2::theme_minimal(), ...) {

  base_theme +
    ggplot2::theme(
      text = ggplot2::element_text(family = "Helvetica"),
      plot.title.position = "plot",
      strip.background = ggplot2::element_rect(linewidth = .2),
      panel.grid.minor.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_line(color = "#EBEBEB"),
      axis.ticks.length = ggplot2::unit(.5, "cm"),
      axis.text.x = ggplot2::element_text(hjust = -.2, vjust = 6),
      ...
    )

}
