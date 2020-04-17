# Exploratory_Data_Analysis_Project1
#### First Project for the Class "Exploratory Data Analysis"

------------------------------------------------------

## The Assignment
The purpose of this project is to get experience using R's *"Base Plotting System"*.
Using data from the *[UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)*, a set of four plots were constructed:

1. Histogram of Global Active Power

2. Line Plot of Global Active Power vs Time

3. Line Plot of Energy Consumption of Three Sub-Circuits vs Time

4. 2 x 2 Grid of Plots Including:
  * Plot 2
  * Plot 3
  * Plot of Voltage vs Time
  * Plot of Global Reactive Power vs Time
  
## The Data
The [data](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption#) were collected by George Hebrail and Alice Berard and downloaded by the author from *[UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)*. The data are comprised of measurements of household energy consumption in minute intervals beginning December 16, 2006. The data used in this project were only the 2880 observations from February 1-2, 2007. The data contain 9 variables:

1. **Date**: in format dd/mm/yyyy

2. **Time**: in format hh:mm:ss

3. **Global_active_power**: minute-averaged active power (in kW)
  * Active power is the electrical power consumed by the overall household to run electrical appliances

4. **Global_reactive_power**: minute-averaged reactive power (in kW)
  * Reactive power is briefly stored in components like inductors and capacitors, but is largely returned and not consumed by appliances<sup>[1](#footnote1)</sup>

5. **Voltage**: minute-averaged voltage (in V)

6. **Global_intensity**: minute-averaged current intensity (in A)

7. **Sub_metering_1**: minute-averaged energy consumption (in Wh)
  * Energy consumption from circuit powering kitchen appliances, including dishwasher, an oven, and a microwave

8. **Sub_metering_2**: minute-averaged energy consumption (in Wh)
  * Energy consumption from circuit powering laundry room appliaces, including a washing machine, tumble-drier, a refrigerator, and a light

9. **Sub_metering_3**: minute-averaged energy consumption (in Wh)
  * Energy consumption from a circuit powering an electric water-heater and an air-conditioner
  
## The Functions
A function named read_HPC_bydate() was written to select observations by date from the whole data set.<sup>[2](#footnote2)</sup> The first two arguments are dates either POSIX format or character, in which case as.Date() will attempt to convert the string. The default dates are "2007-02-01" and "2007-02-02". The third argument is the location of the raw data; default equals *"./household_power_consumption.txt"*. The read_HPC_bydate() relies on the fact that the data collection begins with 396 observations on December 16, 2006 and 1440 observations (one for each minute of the day) for each day afterwards. This strategy worked well enough for the dates used in this project, but the output should be verified if used for other dates. The output of the function is the household consumption data for the dates given with an additional vector, Date_Time, which contains POSIXct values derived from the Date and Time variables in the data.

Four additional scripts were written to plot the data to match the example plots in the assignment. They are named plot**n**.R, where **n** is 1, 2, 3, or 4 depending on the given plot being reproduced. Each script begins by checking whether hpc_data is already stored in the global environment. If not, the script calls read_HPC_bydata() to obtain the necessary data.

The final script, png_plot.R is a wrapper that calls each of the plot**n**.R scripts in turn, saving their outputs to .png files with the same root name. The png() default is to save files in 480x480 pixel sized images.


-----------------------------------------------------------
##### Footnotes

<a name="footnote1">1</a>: Thanks, [Circuit Globe](https://circuitglobe.com/what-is-active-reactive-and-apparent-power.html)!

<a name="footnote2">2</a>: The data set is quite large, and the author wanted to avoid reading the entirety into memory.