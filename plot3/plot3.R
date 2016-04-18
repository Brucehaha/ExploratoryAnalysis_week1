
## set parth
setwd(choose.dir())

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
subepc$Global_active_power <- as.numeric(levels(subepc$Global_active_power))[subepc$Global_active_power]
subepc$Sub_metering_1 <- as.numeric(levels(subepc$Sub_metering_1))[subepc$Sub_metering_1]
subepc$Sub_metering_2 <- as.numeric(levels(subepc$Sub_metering_2))[subepc$Sub_metering_2]
subepc$Sub_metering_3 <- as.numeric(levels(subepc$Sub_metering_3))[subepc$Sub_metering_3]
# subepc$Global_active_power <- as.numeric(as.character(subepc$Global_active_power))

with(subepc, plot(datetime, Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering"))
lines(subepc$datetime, subepc$Sub_metering_2, col = "red")
lines(subepc$datetime, subepc$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##output graph
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()

