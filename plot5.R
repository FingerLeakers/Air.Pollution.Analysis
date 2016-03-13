library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

names <- unique(SCC$EI.Sector)[grepl("Vehicles", unique(SCC$EI.Sector), ignore.case = TRUE)]
vehicles <- unique (SCC %>% filter ( EI.Sector %in% names) %>% select(SCC)) 


d <- NEI %>% filter(SCC %in% vehicles$SCC, fips=="24510") %>% group_by(year)

png(file = "plot5.png", bg = "transparent", height = 466, width = 785)
ggplot(data=d, aes(x=factor(year), y=Emissions)) + geom_bar(stat="identity") + ggtitle("Emissions of PM2.5 from vehicles in Baltimore City") + xlab("Years") + ylab("Emissions of PM2.5")
dev.off()


