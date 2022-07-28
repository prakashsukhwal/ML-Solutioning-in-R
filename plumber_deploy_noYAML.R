library(plumber)
library(jsonlite)

pr = plumb("deploy_noYAML.R")

pr$run(port = 8000)
