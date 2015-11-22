# Plot 6: Comparing emissions from motor vehicle sources in Baltimore City (fips == "24510") 
# Versus emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
setwd("C:/Users/Michelle/dataScience/ExploratoryData")
library(ggplot2)
library(gridExtra)

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCvehicles <- SCC[vehicles,]$SCC
NEIvehicles <- NEI[NEI$SCC %in% SCCvehicles,]
bcvehicles <- NEIvehicles[NEIvehicles$fips=="24510",]
lavehicles <- NEIvehicles[NEIvehicles$fips=="06037",]

# Make plots for each city
left = ggplot(bcvehicles,aes(factor(year),Emissions)) + geom_bar(stat="identity") +
  labs(x="year", y="Emissions", title="Baltimore City")

right = ggplot(lavehicles,aes(factor(year),Emissions)) + geom_bar(stat="identity") +
  labs(x="year", y="Emissions", title="Los Angeles")

# Plot Baltimore City versus Los Angeles side-by-side using gridExtra function
grid.arrange(left, right, ncol=2, nrow = 1)

# Save Plot 6 to a PNG file named "plot6.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot6.png', height=480, width=480)
dev.off()