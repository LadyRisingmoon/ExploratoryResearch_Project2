# Plot 3: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008 by Type?  
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable: 
# Use ggplot plot: Which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
baltimorecity <- subset(NEI, fips == 24510)
unique(baltimorecity$fips)
unique(baltimorecity$type)
qplot(data = baltimorecity, x = year, y = Emissions, facets = ~type, main = "Baltimore City: Emissions by Type (1999-2008)")

# Save Plot 3 to a PNG file named "plot3.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()