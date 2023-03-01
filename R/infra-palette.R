#' Custom color and fill scales
#'
#' Custom coloring and filling functions based on unique color palettes
#'
#' Specific functions include:
#' \itemize{
#' \item{scale_(color/colour/fill)_discrete_starfish}{Discrete palette with either fixed or dynamically extended number of shades}
#' \item{scale_(color/colour/fill)_opinionated_starfish}{Discrete palette with specific values for "good", "bad", and "neutral"}
#' \item{scale_(color/colour/fill)_diverging_starfish}{Continuous diverging color palette, must contain negative, neutral and positive values}
#' \item{scale_(color/colour/fill)_continuous}{COntinuous color palette}
#' }
#'
#' @name scale_custom
#'
#' @param palette Name of color palette
#' @param extend Whether to extend discrete color palette to make sufficient colors for levels needed
#' @param ... Additional arguments to be passed to internal scale function
NULL


# DISCRETE ----

#' @rdname scale_custom
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(diamonds[1:2000,], aes(x = cut, y = carat,
#' color = cut)) +
#' geom_point() +
#' scale_color_starfish_d()
scale_color_starfish_d <- function(palette = "starfish", extend = FALSE, ...){

  pal <- retrieve_palette(palette, "base")
  ggplot2::discrete_scale("colour", "starfish",
                          manual_pal_flex(pal, extend),
                          na.value = "grey50",
                          ...)

}

#' @rdname scale_custom
#' @export
scale_colour_starfish_d <- scale_color_starfish_d

#' @rdname scale_custom
#' @export
scale_fill_starfish_d <- function(palette = "starfish", extend = FALSE, ...){

  pal <- retrieve_palette(palette, "base")
  ggplot2::discrete_scale("fill", "starfish",
                          manual_pal_flex(pal, extend),
                          na.value = "grey50",
                          ...)

}

# OPINIONATED ----

#' @rdname scale_custom
#' @export
scale_color_starfish_op <- function(palette = "starfish", ...){

  pal <- retrieve_palette(palette, "op")[1:3]
  names(pal) <- c("good", "neutral", "bad")
  ggplot2::scale_color_manual(values = pal, ...)

}

#' @rdname scale_custom
#' @export
scale_colour_starfish_op <- scale_color_starfish_op

#' @rdname scale_custom
#' @export
scale_fill_starfish_op <- function(palette = "starfish", ...){

  pal <- retrieve_palette(palette, "op")[1:3]
  names(pal) <- c("good", "neutral", "bad")
  ggplot2::scale_fill_manual(values = pal, ...)

}

# CONTINUOUS DIVERGING ----

#' @rdname scale_custom
#' @export
scale_color_starfish_div <- function(palette = "starfish", ...) {

  pal <- retrieve_palette(palette, "div")
  ggplot2::scale_colour_gradient2(low = pal[3],
                                  mid = pal[2],
                                  high = pal[1],
                                  ...)

}

#' @rdname scale_custom
#' @export
scale_colour_starfish_div <- scale_color_starfish_div

#' @rdname scale_custom
#' @export
scale_fill_starfish_div <- function(palette = "starfish", ...) {

  pal <- retrieve_palette(palette, "div")
  ggplot2::scale_fill_gradient2(low = pal[3],
                                mid = pal[2],
                                high = pal[1],
                                ...)

}

# CONTINUOUS ----

#' @rdname scale_custom
#' @export
scale_color_starfish_c <- function(palette = "starfish", ...) {

  pal <- retrieve_palette(palette, "cont")
  ggplot2::scale_colour_gradient(low = pal[1],
                                 high = pal[2],
                                 ...)

}

#' @rdname scale_custom
#' @export
scale_colour_starfish_c <- scale_color_starfish_c

#' @rdname scale_custom
#' @export
scale_fill_starfish_c <- function(palette = "starfish", ...) {

  pal <- retrieve_palette(palette, "cont")
  ggplot2::scale_fill_gradient(low = pal[1], high = pal[2], ...)

}

# HELPERS ----

#' Get names of all unique palettes provided in starfish
#'
#' @param full Whether to include full palette names (with suffixes, e.g. \code{_cont}) or just stubs
#' @return Vector of palette name stubs or full names
#' @export
#'
#' @examples get_starfish_palettes()

get_starfish_palettes <- function(full = FALSE){

  re <- if (full) "^.*_pal(_op|_cont|_div)?$" else "^.*_pal$"
  grep(re, getNamespaceExports("starfish"), value = TRUE)

}

# Create additional colors from palette as needed
#' @keywords internal
manual_pal_flex <- function(values, extend = FALSE){

  force(values)
  function(n) {
    n_values <- length(values)
    if (n > n_values & !extend) {
      warning("This manual palette can handle a maximum of ",
              n_values, " values. You have supplied ", n, ".",
              "Set parameter extend = TRUE if you wish to ",
              "interpolate a broader spectrum of colors.",
              call. = FALSE)
    }
    else if (n > n_values) {
      values <- grDevices::colorRampPalette(values)(n)
    }
    values[seq_len(n)]
  }

}


# Retrieve palette with reasonable defaults upon failure
# Tries for specific request, else tries to default to base, else fails
# Also checks palette length meets fx requirements, else modifies
#' @keywords internal
retrieve_palette <- function(name, type = c("base", "op", "div", "cont")){

  match.arg(type)

  # attempt to get palette requested
  pal_base <- paste0(name, "_pal")
  pal_name <- if (type == "base") pal_base else paste0(name, "_pal_", type)
  pal <- try(utils::getFromNamespace(pal_name, "starfish"))

  # if fails, attempt to use base palette
  # if (class(pal) == "try-error")
  if (methods::is(pal, "try-error")) {
    pal <- try(utils::getFromNamespace(pal_base, "starfish"))
  }

  # if base fails, throw error
  # if (class(pal) == "try-error")
  if (methods::is(pal, "try-error")) {
    stop("No such palette exists. ",
         "Run get_starfish_palettes() to see options. ",
         call. = FALSE)
  }

  # if any palette succeeds, validate it is of needed length
  if (length(pal) == 2 & type %in% c("div", "op")) {

    warning("Palette has length of two. ",
            "To use with this scale, it has been modified. ",
            "Inspect your plot to ensure the resulting scale makes sense. ",
            call. = FALSE)

    pal <- c(pal[1], "darkgrey", pal[2])
  }
  if (length(pal) == 1) {

    warning("Palette has length of one. ",
            "Colors will be repeated. ",
            call. = FALSE)

    if (type %in% c("base", "cont")) pal <- c(pal, pal)
    else pal <- c(pal, "darkgrey", pal)

  }

  # unname the vectors for my color scales, otherwise the function
  # breaks
  pal <- unname(pal)
  return(pal)


}
