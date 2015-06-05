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
    
    epc.dataset <- EPC$ReadDataset()
    
    par(mfrow = c(2, 2))
    
    EPC$Plot2(epc.dataset)
    
    plot(Voltage ~ DateTime, data = epc.dataset,
         xlab = "datetime", ylab = "Voltage",
         pch=NA)
    lines(Voltage ~ DateTime, data = epc.dataset)
    
    EPC$Plot3(epc.dataset, legend.border = F)
    
    plot(Global_reactive_power ~ DateTime, data = epc.dataset,
         xlab = "datetime", ylab = "Global_reactive_power",
         pch=NA)
    lines(Global_reactive_power ~ DateTime, data = epc.dataset)
    
    EPC$PlotToPNG("plot4.png")
    
})()