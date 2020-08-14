## code to prepare `igrams` dataset goes here
files <- list.files("inst/extdata", full.names = TRUE)
igrams <- lapply(files, function(x) { readRDS(x)[-1] })
names(igrams) <- tools::file_path_sans_ext(basename(files))
igrams <- dplyr::bind_rows(lapply(igrams, function(x) {
  out <- tibble::enframe(x, name = NULL)
  names(out) <- "icon"
  out
}), .id = "lib")

igrams$url <- paste0("https://icongr.am/", igrams$lib, "/", igrams$icon, ".svg")

usethis::use_data(igrams, overwrite = TRUE)
