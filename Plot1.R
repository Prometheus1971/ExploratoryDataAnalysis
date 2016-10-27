#Plot1.R

#Function to Load the house hold power data and create Plot1
makePlot1<- function(){
power<- read.csv("power.txt",sep=";",header=TRUE)

#Convert the Date column to a date type
power$Date<- as.Date(power$Date,"%d/%m/%Y")

#get the target dates
targetDays<- power[power$Date =="2007-02-01" | power$Date=="2007-02-02",]
#make Global Active Power a numeric type
targetDays$Global_active_power<- as.numeric(as.character(targetDays$Global_active_power))

#Create Plot 1
hist(targetDays$Global_active_power,col = "Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
}