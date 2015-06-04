# Remove all variables
rm(list = ls())

# Load submodules
source("load_libraries.R")
source("epc_read.R")
source("epc_plot_write.R")

# Install/update and load required libraries
LoadLibraries("data.table", "dplyr", "sqldf")

(function() {
    
    epc.dataset <<- EPC$ReadDataset()
    plot(Global_active_power ~ 1, data = epc.dataset, pch=NA)
    lines(Global_active_power ~ 1, data = epc.dataset, pch=NA)
    
    EPC$PlotToPNG("plot2.png")
    
})()