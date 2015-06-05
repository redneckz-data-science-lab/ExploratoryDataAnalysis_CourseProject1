# Remove all variables
rm(list = ls())

# Load submodules
source("load_libraries.R")
source("epc_read.R")
source("epc_plot_write.R")

# Install/update and load required libraries
LoadLibraries("data.table", "dplyr", "sqldf")

(function() {
    
    # Constants
    COLORS <- c("black", "red", "blue")
    
    epc.dataset <<- EPC$ReadDataset()
    col.names <- names(epc.dataset)
    sub.metering.col.names <- col.names[grep("Sub_", col.names)]
    
    plot(Sub_metering_1 ~ DateTime, data = epc.dataset,
         xlab = "", ylab = "Energy sub metering",
         pch=NA)
    for (index in 1:length(sub.metering.col.names)) {
        sub.metering <- sub.metering.col.names[index]
        lines(epc.dataset[["DateTime"]], epc.dataset[[sub.metering]], col = COLORS[index])
    }
    legend("topright", sub.metering.col.names, lty = 1, col = COLORS)
    
    EPC$PlotToPNG("plot3.png")
    
})()