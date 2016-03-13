library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d <- NEI %>% group_by(year) %>% summarise(sum(Emissions))


png(file = "plot1.png", bg = "transparent", height = 466, width = 785)
barplot(d$`sum(Emissions)`, names.arg=(d$year), main="Total PM2.5 emission from all sources over the years", xlab="Years", ylab="Total PM2.5 emission from all sources")
dev.off()

