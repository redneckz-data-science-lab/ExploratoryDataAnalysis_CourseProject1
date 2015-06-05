# Remove all variables
rm(list = ls())

# Load submodules
source("load_libraries.R")
source("epc_read.R")
source("common_plots.R")
source("epc_plot_write.R")

# Install/update and load required libraries
LoadLibraries("data.table", "dplyr", "sqldf")

(function() {
    
    par(mfrow = c(1, 1))
    EPC$Plot2(EPC$ReadDataset())
    
    EPC$PlotToPNG("plot2.png")
    
})()