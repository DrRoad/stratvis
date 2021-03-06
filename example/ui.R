library(timevis)
library(DT)

source("setup.R", local=TRUE)
source("ui-helpers.R", local = TRUE)

fluidPage(
  title =  paste(appName, appDescription, sep=" - "),
  tags$head(
    #tags$script(src="jquery.dataTables.min.js"),
    tags$link(href = "style.css", rel = "stylesheet")
    #tags$link(href = "jquery.dataTables.min.css", rel = "stylesheet")
    
    # Favicon
    #if(appname == 'a10') {
    #tags$link(rel = "shortcut icon", type="image/x-icon", href="favicon_a10/favicon.ico")
    #}
    
  ),
  #tags$a(
  #  href="http://dataprone.info",
  #  tags$img(style="position: absolute; top: 5px; right: 5px; border: 0; height: 220px;",
  #           src="bsg.png",
  #           alt="Follow PaulEAdamson on Twitter")
  #),
  div(id = "header",
    div(id = "title",
      appName
    ),
    div(id = "subtitle",
        appDescription)#,
    #div(id = "subsubtitle",
        #"A",
        #tags$a(href = "http://dataprone.info", "DataProne"),
        #"App",
        #HTML("&bull;"),
        #"Available",
        #tags$a(href = "https://github.com/padamson/stratvis", "on GitHub")
    #)
  ),
  tabsetPanel(
    id = "mainnav",
    
    tabPanel(
      div(icon("calendar"), "Production demo"),
      fluidRow(
        column(
          12,
          div(id = "interactiveActions",
              class = "optionsSection",
              #tags$h4("Actions:"),
              actionButton("fitTimelineGroups", "Fit all items"),
              actionButton("showAllGoals", "Show All Goals"),
              actionButton("showIW1Goals", "Show IW1 Goals"),
              actionButton("showIW2Goals", "Show IW2 Goals"),
              actionButton("hideGoals", "Hide Goals")#,
              #actionButton("setWindowAnim", "Set window 2016-01-07 to 2016-01-25"),
              #actionButton("setWindowNoAnim", "Set window without animation"),
              #actionButton("center", "Center around 2016-01-23"),
              #actionButton("focus2", "Focus item 4"),
              #actionButton("focusSelection", "Focus current selection"),
              #actionButton("addTime", "Add a draggable vertical bar 2016-01-17")
          )
        )
      ),
      fluidRow(
        column(9,
               fluidRow(
                 column(12,timevisOutput("timelineGroups"))
               )
        ),
        column(3,
               div(id = 'acronymsTable',
                   class = 'tableSection',
                   fluidRow(
                     tags$h4("Acronyms:"),
                     column(12,DT::dataTableOutput("acronyms"))
                   )
               )
        )
      ),
      div(class = "sourcecode",
          "The exact code for all the timelines in this app is",
          tags$a(href = sourceCodeOnGithub,
                 "on GitHub")
      )
    ),
    
    tabPanel(
      div(icon("sliders"), "Fully interactive demo"),
      fluidRow(
        column(
          8,
          fluidRow(column(12,
                          timevisOutput("timelineInteractive")
          )),
          fluidRow(
            column(
              12,
              div(id = "interactiveActions",
                  class = "optionsSection",
                  tags$h4("Actions:"),
                  actionButton("fit", "Fit all items"),
                  actionButton("setWindowAnim", "Set window 2016-01-07 to 2016-01-25"),
                  actionButton("setWindowNoAnim", "Set window without animation"),
                  actionButton("center", "Center around 2016-01-23"),
                  actionButton("focus2", "Focus item 4"),
                  actionButton("focusSelection", "Focus current selection"),
                  actionButton("addTime", "Add a draggable vertical bar 2016-01-17")
              )
            )
          ),
          fluidRow(
            column(
              4,
              div(class = "optionsSection",
                  uiOutput("selectIdsOutput", inline = TRUE),
                  actionButton("selectItems", "Select"),
                  checkboxInput("selectFocus", "Focus on selection", FALSE)
              )
            ),
            column(
              4,
              div(class = "optionsSection",
                  textInput("addText", tags$h4("Add item:"), "New item"),
                  dateInput("addDate", NULL, "2016-01-15"),
                  actionButton("addBtn", "Add")
              )
            ),
            column(
              4,
              div(class = "optionsSection",
                  uiOutput("removeIdsOutput", inline = TRUE),
                  actionButton("removeItem", "Remove")
              )
            )
          )
        ),
        column(4,
               div(
                 id = "timelinedata",
                 class = "optionsSection",
                 tags$h4("Data:"),
                 tableOutput("table"),
                 hr(),
                 div(tags$strong("Visible window:"),
                     textOutput("window", inline = TRUE)),
                 div(tags$strong("Selected items:"),
                     textOutput("selected", inline = TRUE))
               )
        )
      ),
      div(class = "sourcecode",
          "The exact code for all the timelines in this app is",
          tags$a(href = sourceCodeOnGithub,
                 "on GitHub")
      )
    )
    
  )
)
