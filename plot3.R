library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d <- NEI %>% filter(fips=="24510") %>% group_by(year, type)

png(file = "plot3.png", bg = "transparent", height = 466, width = 785)
ggplot(data=d, aes(x=factor(year), y=Emissions, fill=type)) + geom_bar(stat="identity", position = "dodge") + ggtitle("Emissions of PM2.5 in Baltimore City per Type") + xlab("Years") + ylab("Type")
dev.off()
