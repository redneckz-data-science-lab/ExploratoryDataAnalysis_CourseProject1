if (!exists("EPC")) {
    # Declaring namespace
    EPC <- list()
}

(function() {
    
    # Public functions
    
    EPC$Plot2 <<- function(epc.dataset) {
        #
        # Draws Plot #2
        # 
        # Args:
        #   epc.dataset - EPC data
        #
        # Retuns:
        #   nothing
        #
        
        plot(Global_active_power ~ DateTime, data = epc.dataset,
             xlab = "", ylab = "Global Active Power (kilowatts)",
             pch=NA)
        lines(Global_active_power ~ DateTime, data = epc.dataset)
    }
    
    EPC$Plot3 <<- function(epc.dataset, colors = c("black", "red", "blue"), legend.border = T) {
        #
        # Draws Plot #2
        # 
        # Args:
        #   epc.dataset - EPC data
        #   colors - subplots colors
        #   legend.border
        #
        # Retuns:
        #   nothing
        #
        
        col.names <- names(epc.dataset)
        sub.metering.col.names <- col.names[grep("Sub_", col.names)]
        
        plot(Sub_metering_1 ~ DateTime, data = epc.dataset,
             xlab = "", ylab = "Energy sub metering",
             pch=NA)
        for (index in 1:length(sub.metering.col.names)) {
            sub.metering <- sub.metering.col.names[index]
            lines(epc.dataset[["DateTime"]], epc.dataset[[sub.metering]], col = colors[index])
        }
        legend("topright", legend = sub.metering.col.names, lty = 1, col = colors,
               bty = ifelse(legend.border, "o", "n"))
    }
    
    
})()
