# Plot 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Use base plot: Plot total PM2.5 emission from Baltimore City (fips = 24510) for each of the years 1999, 2002, 2005, and 2008
baltimorecity <- subset(NEI, fips == 24510) 
unique(baltimorecity$fips)
baltemissionsbyyear <- aggregate(cbind(baltimorecity$Emissions) ~ baltimorecity$year, FUN = sum)
plot(baltemissionsbyyear, type="l")

# Save Plot 2 to a PNG file named "plot2.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()