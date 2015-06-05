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
    plot(Global_active_power ~ DateTime, data = epc.dataset,
         xlab = "", ylab = "Global Active Power (kilowatts)",
         pch=NA)
    lines(Global_active_power ~ DateTime, data = epc.dataset)
    
    EPC$PlotToPNG("plot2.png")
    
})()