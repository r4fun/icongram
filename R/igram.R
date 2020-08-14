#' Return an icon
#'
#' @param icon icon name
#' @param lib icon library
#' @param size icon size
#' @param color icon color as hexcode, excluding #
#' @export
igram <- function(icon, lib = "simple", size = 128, color = "default") {
  if (color == "default") color <- "currentColor"
  out <- glue::glue("https://icongr.am/{lib}/{icon}.svg?size={size}&color={color}")
  htmltools::browsable(htmltools::includeHTML(out))
}
