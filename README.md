
<!-- README.md is generated from README.Rmd. Please edit that file -->

icongram
========

<!-- badges: start -->
<!-- badges: end -->

10,107 icons for shiny development thanks to
[icongram](https://icongr.am).

Installation
------------

You can install the development version of hover from GitHub with:

    # install.packages("devtools")
    devtools::install_github("r4fun/icongram")

Example
-------

Return an icon by calling `igram`:

    igram(
      icon = "r",
      lib = "simple",
      size = 128,
      color = "default" # or a hex code, e.g. ff2600
    )

Icon information is stored in `igrams`:

    igrams
    #> # A tibble: 10,107 x 3
    #>    lib     icon            url                                          
    #>    <chr>   <chr>           <chr>                                        
    #>  1 clarity accessibility-1 https://icongr.am/clarity/accessibility-1.svg
    #>  2 clarity accessibility-2 https://icongr.am/clarity/accessibility-2.svg
    #>  3 clarity add             https://icongr.am/clarity/add.svg            
    #>  4 clarity add-text        https://icongr.am/clarity/add-text.svg       
    #>  5 clarity administrator   https://icongr.am/clarity/administrator.svg  
    #>  6 clarity airplane        https://icongr.am/clarity/airplane.svg       
    #>  7 clarity alarm-clock     https://icongr.am/clarity/alarm-clock.svg    
    #>  8 clarity alarm-off       https://icongr.am/clarity/alarm-off.svg      
    #>  9 clarity alert           https://icongr.am/clarity/alert.svg          
    #> 10 clarity align-bottom    https://icongr.am/clarity/align-bottom.svg   
    #> # … with 10,097 more rows

A small shiny example:

    library(shiny)
    library(icongram)

    ui <- fluidPage(
      fluidRow(
        column(
          width = 12,
          align = "center",
          h1("icongram for shiny"),
          igram("r"),
          br(),
          tags$code('icongram::igram("r")')
        )
      )
    )

    server <- function(input, output, session) {
      
    }

    shinyApp(ui, server)

<img src="man/figures/demo.png" width="100%" />
