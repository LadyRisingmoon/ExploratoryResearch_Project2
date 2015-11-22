# Plot 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find all unique values of Pollutant and Years
unique(NEI$Pollutant)
unique(NEI$year)

# Use base plot: Plot total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
emissionsbyyear <- aggregate(cbind(Emissions) ~ year,data=NEI, sum)
plot(emissionsbyyear, type="l", main = "PM2.5 Emissions 1999-2008")

# Save Plot 1 to a PNG file named "plot1.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()