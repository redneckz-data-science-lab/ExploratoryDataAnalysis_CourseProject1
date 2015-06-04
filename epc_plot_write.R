if (!exists("EPC")) {
    # Declaring namespace
    EPC <- list()
}

(function() {
    
    # Public functions
    
    EPC$PlotToPNG <<- function(png.file) {
        #
        # Writes plot to specified png file
        # 
        # Args:
        #   png.file: target png file path
        #
        # Retuns:
        #   nothing
        #
        
        d <- dev.copy(png, filename = png.file, width = 480, height = 480)
        dev.off(d)
    }
    
    
})()
