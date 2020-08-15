#' Return an icon
#'
#' @param icon icon name
#' @param lib icon library
#' @param size icon size
#' @param color icon color as hexcode, excluding #
#' @param raw return raw html instead of viewing icon in rstudio viewer
#' @seealso \code{\link{igrams}}
#' @export
igram <- function(icon, lib = "simple", size = 128, color = "default", raw = FALSE) {
  if (color == "default") color <- "currentColor"
  parsed_url <- glue::glue("https://icongr.am/{lib}/{icon}.svg?size={size}&color={color}")
  url_out <- httr::GET(parsed_url)

  if (httr::status_code(url_out) == 404) {
    stop(
      "Unable to fetch icon `", icon, "`",
      "\n* Does the icon name exist? See `igrams`",
      "\n* Requested: ", parsed_url,
      call. = FALSE
    )
  } else {
    x <- httr::content(url_out, type = "text", encoding = "UTF-8")
    if (raw) {
      htmltools::HTML(x)
    } else {
      htmltools::browsable(htmltools::HTML(x))
    }
  }
}
