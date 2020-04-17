source("./read_HPC_bydate.R")
if (!exists("hpc_data")) {hpc_data <- read_HPC_bydate()}

## DIVIDE PLOT INTO 2 ROWS AND 2 COLS
par(mfcol=c(2,2))

## PLOT GLOBAL ACTIVE POWER VS DATETIME
source("./plot2.R")

## PLOT SUB_METERING VS DATETIME
source("./plot3.R")

## PLOT VOLTAGE VS DATETIME
plot(hpc_data$Date_Time,
     hpc_data$Voltage,
     xaxt="n",
     xlab="datetime",
     ylab = "Voltage",
     type = "n")
lines(hpc_data$Date_Time,hpc_data$Voltage)
axis.POSIXct(1,hpc_data$Date_Time,format = "%a")

## PLOT GLOBAL REACTIVE POWER VS DATETIME
plot(hpc_data$Date_Time,
     hpc_data$Global_Reactive_Power,
     xaxt="n",
     xlab="datetime",
     ylab = "Global_reactive_power",
     type = "n")
lines(hpc_data$Date_Time,hpc_data$Global_Reactive_Power)
axis.POSIXct(1,hpc_data$Date_Time,format = "%a")