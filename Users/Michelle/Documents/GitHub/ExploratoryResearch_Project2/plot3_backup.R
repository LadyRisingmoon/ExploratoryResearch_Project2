# Plot 2: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
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
qplot(data = baltimorecity, x = year, y = Emissions, facets = ~type)

# bcpoint <- subset(baltimorecity, type == "POINT")
# bcnonpoint <- subset(baltimorecity, type == "NONPOINT")
# bconroad <- subset(baltimorecity, type == "ON-ROAD")
# bcnonroad <- subset(baltimorecity, type == "NON-ROAD")

# bcpointemissionsbyyear <- aggregate(cbind(bcpoint$Emissions) ~ bcpoint$year, FUN = sum)
# bcnonpointemissionsbyyear <- aggregate(cbind(bcnonpoint$Emissions) ~ bcnonpoint$year, FUN = sum)
# bconroademissionsbyyear <- aggregate(cbind(bconroad$Emissions) ~ bconroad$year, FUN = sum)
# bcnonroademissionsbyyear <- aggregate(cbind(bcnonroad$Emissions) ~ bcnonroad$year, FUN = sum)



ggplot(bcpointemissionsbyyear, aes(x=year, y=Emissions)) 
par(mfrow=c(1,2))
plota <- qplot(bcpointemissionsbyyear)
plotb <- qplot(bcnonpointemissionsbyyear)


# Save Plot 3 to a PNG file named "plot3.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()




#Subset the years: 1999, 2002, 2005, and 2008
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 



ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()