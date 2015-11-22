# Plot 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
setwd("C:/Users/Michelle/dataScience/ExploratoryData")
library(ggplot2)

# Load data 
# NB: rds file format is Microsoft SQL Server Reporting Services data source file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset emissions from coal combustion-related sources
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcombustion <- (combustion & coal)
SCCcombustion <- SCC[coalcombustion,]$SCC
NEIcombustion <- NEI[NEI$SCC %in% SCCcombustion,]

# Plot Coal Combustion Source Emissions from 1999-2008
ggplot(NEIcombustion,aes(factor(year),Emissions)) + geom_bar(stat="identity") +
  labs(x="year", y="Emissions", title="US: Coal Combustion Source Emissions (1999-2008)")

# Save Plot 4 to a PNG file named "plot4.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()