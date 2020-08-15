## code to prepare `material` dataset goes here
library(crrri)
library(rvest)
library(promises)

chrome <- Chrome$new()
client <- chrome$connect(callback = function(client) {
  client$inspect()
})

Page <- client$Page
Runtime <- client$Runtime
Page$navigate(url = "https://icongr.am/material")
# scroll to end
Runtime$evaluate(expression = 'document.documentElement.outerHTML') %...>%
  {
    out <- .$result$value %>%
      xml2::read_html() %>%
      rvest::html_nodes("code") %>%
      rvest::html_text()

    saveRDS(out, "inst/extdata/material.rds", version = 2)
  } %>%
  finally(~ client$disconnect())

