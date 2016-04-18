
## set parth
        setwd("C:/Users/Bruce/Dropbox/R/Exploratory Data Analysis")

## Electric power consumption data(epc)
        epc <- read.table("household_power_consumption.txt", sep = ";",quote ="", header = TRUE)

        # conver factor format to date format for column Date in epc
        epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
        # conver factor format to time format for column Time in epc
        epc$datetime <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

        #filter data between 2007-02-01 and 2007-02-02        
        subepc <- subset(epc, Date %in% as.Date(c("2007-02-01","2007-02-02")))

## plot graph
        # convert factor to numeric
        global_active_power <- as.numeric(levels(subepc$Global_active_power))[subepc$Global_active_power]
       
        #plot histogram 
        hist(global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## output png
        dev.copy(png, "plot1.png")
        dev.off()

