library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

names <- unique(SCC$EI.Sector)[grepl("Vehicles", unique(SCC$EI.Sector), ignore.case = TRUE)]
vehicles <- unique (SCC %>% filter ( EI.Sector %in% names) %>% select(SCC)) 

d <- NEI %>% filter(SCC %in% vehicles$SCC, fips %in% c("24510", "06037")) %>% group_by(year)


png(file = "plot6.png", bg = "transparent", height = 466, width = 785)
ggplot(data=d, aes(x=factor(year), y=Emissions, fill=fips)) + geom_bar(stat="identity", position = "dodge") + ggtitle("Emissions of PM2.5 from vehicles") + xlab("Years") + ylab("Emissions of PM2.5")
dev.off()


