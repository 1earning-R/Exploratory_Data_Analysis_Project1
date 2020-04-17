## SOURCE read_HPC_bydate.R to GLOBAL ENVIRONMENT
## RUN FUNCTION IF hpc_data DOES NOT EXIST
source("./read_HPC_bydate.R")
if (!exists("hpc_data")) {hpc_data <- read_HPC_bydate()}

plot(hpc_data$Date_Time,
     hpc_data$Global_Active_Power,
     xaxt="n",
     xlab="",
     ylab = "Global Active Power (kilowatts)",
     type = "n")
lines(hpc_data$Date_Time,hpc_data$Global_Active_Power)
axis.POSIXct(1,hpc_data$Date_Time,format = "%a")