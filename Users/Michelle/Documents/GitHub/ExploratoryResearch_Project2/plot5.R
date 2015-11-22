# Plot 5: In Baltimore City, how have emissions from coal combustion-related sources changed from 1999-2008?
setwd("C:/Users/Michelle/dataScience/ExploratoryData")
library(ggplot2)

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the motor vechicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCvehicles <- SCC[vehicles,]$SCC
NEIvehicles <- NEI[NEI$SCC %in% SCCvehicles,]
bcvehicles <- NEIvehicles[NEIvehicles$fips=="24510",]

# Plot emissions from coal combustion-related sources changed from 1999-2008
ggplot(bcvehicles,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") + labs(x="year", y="Emissions", title="Baltimore City: Coal Combustion Source Emissions (1999-2008)")

# Save Plot 5 to a PNG file named "plot5.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot5.png', height=480, width=480)
dev.off()