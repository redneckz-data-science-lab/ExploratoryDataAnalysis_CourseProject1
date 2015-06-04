# Remove all variables
rm(list = ls())

# Load submodules
source("load_libraries.R")
source("epc_read.R")
source("epc_plot_write.R")

# Install/update and load required libraries
LoadLibraries("data.table", "dplyr", "sqldf")

(function() {
    
    epc.dataset <- EPC$ReadDataset()
    hist(epc.dataset[["Global_active_power"]],
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)", col = "red")
    
    EPC$PlotToPNG("plot1.png")
    
})()