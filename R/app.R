library(shiny)
library(methods)
library(AIRSpec)

AIRSPECDir <- "/usr/local/lib/R/site-library/AIRSpec/ShinyApp/"
runApp(appDir = AIRSPECDir, host = "0.0.0.0", port = 3838)