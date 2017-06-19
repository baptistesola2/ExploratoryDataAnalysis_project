#Reading the data
dataa<- read.table("./household_power_consumption.txt",header = TRUE,sep = ";")

datasplit <- split(dataa,dataa[,1])

datasub <- rbind(datasplit$`1/2/2007`,datasplit$`2/2/2007`)

#Cleaning the data
datasub$Voltage <- as.numeric(as.character(datasub$Voltage))
datasub$Global_active_power <- as.numeric(as.character(datasub$Global_active_power))
datasub$Global_reactive_power <- as.numeric(as.character(datasub$Global_reactive_power))
datasub$Global_intensity <- as.numeric(as.character(datasub$Global_intensity))
datasub$Sub_metering_1 <- as.numeric(as.character(datasub$Sub_metering_1))
datasub$Sub_metering_2 <- as.numeric(as.character(datasub$Sub_metering_2))
datasub$Sub_metering_3 <- as.numeric(as.character(datasub$Sub_metering_3))

#Drawing plots
#plot 1
png(filename = 'plot1.png', width = 480, height = 480)
hist(datasub$Global_active_power,main = "Global active power", xlab = 'Global active power (kilowatts)',col="red")
dev.off()


#plot2
png(filename = 'plot2.png', width = 480, height = 480)

plot(datasub$Global_active_power, type="l", col="black", ylab='Gloabl Active Power (kilowatts)',xlab="", axes = F)

axis(1,pos=c(0,1440,2880),labels=c('Wed','Thu','Fri'),at = c(0,1440,2880))
axis(2, labels = c(0,2,4,6), at =c(0,2,4,6))
box()
dev.off()

#plot 3
png(filename = 'plot3.png', width = 480, height = 480)

plot(datasub$Sub_metering_1, type="l", col="black", ylab='Energy sub metering',xlab="", axes = F)

lines (datasub$Sub_metering_2, col="red")
lines ((datasub$Sub_metering_3), col="blue")
axis(2,at= c(0,10,20,30),labels=c(0,10,20,30))
axis(1,labels=c('Thu','Fri','Sat'),at = c(0,1440,2880))
box()
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c("black","red","blue"), lwd =1);
dev.off()

#plot 4
png(filename = 'plot4.png', width = 480, height = 480)

par(cex.lab = 0.75, cex.axis=0.75, mfrow = c(2,2),mar=c(4,4,1,1))

#plot4.1
plot(datasub$Global_active_power, type="l", col="black", ylab='Global Active Power',xlab="", axes = F)

axis(1,pos=c(0,1440,2880),labels=c('Wed','Thu','Fri'),at = c(0,1440,2880))
axis(2, labels = c(0,2,4,6), at =c(0,2,4,6))
box()
#plot4.2
plot(datasub$Voltage, type="l", col="black", ylab='Voltage',xlab="datetime", axes = F)

axis(2,at= c(234,236,238,240,242,244,246),labels=c(234,236,238,240,242,244,246))
axis(1,labels=c('Thu','Fri','Sat'),at = c(0,1440,2880))
box()

#plot4.3
plot(datasub$Sub_metering_1, type="l", col="black", ylab='Energy sub metering',xlab="", axes = F)

lines (datasub$Sub_metering_2, col="red")
lines ((datasub$Sub_metering_3), col="blue")
axis(2,at= c(0,10,20,30),labels=c(0,10,20,30))
axis(1,labels=c('Thu','Fri','Sat'),at = c(0,1440,2880))
box()
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c("black","red","blue"), lwd =1,cex =0.75,bty = "n")


#plot 4.4
plot(datasub$Global_reactive_power, type="l", col="black", ylab='Global_reactive_power',xlab="datetime", axes = F)
axis(2,at= c(0,0.1,0.2,0.3,0.4,0.5),labels=c(0,0.1,0.2,0.3,0.4,0.5))
axis(1,labels=c('Thu','Fri','Sat'),at = c(0,1440,2880))
box()
dev.off()

