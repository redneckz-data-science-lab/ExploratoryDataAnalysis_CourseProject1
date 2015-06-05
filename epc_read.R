if (!exists("EPC")) {
    # Declaring namespace
    EPC <- list()
}

(function() {
    
    # Constants
    
    EPC_ZIP_FILE <- "exdata-data-household_power_consumption.zip"
    EPC_CSV_FILE <- "household_power_consumption.txt"
    
    # Public functions
    
    EPC$ReadDataset <<- function() {
        #
        # Reads electric power consumption data from file
        # 
        # Retuns:
        #   data.table with EPC measurements
        #

        if (!file.exists(EPC_CSV_FILE)) {
            unzip(EPC_ZIP_FILE, exdir = ".")
        }
        epc.dataset <- data.table(read.csv.sql(EPC_CSV_FILE,
                                               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                                               sep=";"))
        epc.dataset[, DateTime := as.POSIXct(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))]
        
        return(epc.dataset)
    }
    
    
})()
