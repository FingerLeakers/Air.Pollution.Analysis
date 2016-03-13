library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

names <- unique(SCC$EI.Sector)[grepl("coal", unique(SCC$EI.Sector), ignore.case = TRUE)]
coal <- unique (SCC %>% filter ( EI.Sector %in% names) %>% select(SCC)) 


d <- NEI %>% filter(SCC %in% coal$SCC) %>% group_by(year) %>% summarise(sum(Emissions))

png(file = "plot4.png", bg = "transparent", height = 466, width = 785)
barplot(d$`sum(Emissions)`, names.arg=(d$year), main="PM2.5 emissions from coal combustion-related sources over the years", xlab="Years", ylab="PM2.5 emissions")
dev.off()
