## SOURCE read_HPC_bydate() TO GLOBAL ENVIRONMENT
## RUN FUNCTION IF hpc_data DOES NOT EXIST
source("./read_HPC_bydate.R")
if (!exists("hpc_data")) {hpc_data <- read_HPC_bydate()}

## DEFINE LABELLING SCHEME FOR SUB_METERING PLOT
meter_colors <- c("black","red","blue")
meter_labels <- c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3")

## FIND MAXIMUM VALUED SUB_METERING VARIABLE
## This is to create a y axis with appropriate scaling
maxes <- sapply(meter_labels, temp <- function(n) max(hpc_data[,n]))
maxmax <- which(maxes == max(maxes))

## INITIATE AXES
plot(hpc_data$Date_Time,
     hpc_data[,meter_labels[maxmax]],
     xaxt = "n",
     xlab = "",
     ylab = "Energy sub metering",
     type = "n")

## PLOT LINES USING SCHEME DEFINED ABOVE
lines(hpc_data$Date_Time,hpc_data[,meter_labels[1]], col=meter_colors[1])
lines(hpc_data$Date_Time,hpc_data[,meter_labels[2]], col=meter_colors[2])
lines(hpc_data$Date_Time,hpc_data[,meter_labels[3]], col=meter_colors[3])


## ADD TIME SCALE TO X AXIS
axis.POSIXct(side = 1, hpc_data$Date_Time, format = "%a")


## ADD LEGEND USING SCHEME DEFINED ABOVE
legend("topright",
       lty = 1, 
       col = meter_colors, 
       legend = meter_labels)