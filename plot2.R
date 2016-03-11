library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d <- NEI %>% filter(fips=="24510") %>% group_by(year) %>% summarise(sum(Emissions))
barplot(d$`sum(Emissions)`, names.arg=(d$year), main="PM2.5 emission in Baltimore from all sources over the years", xlab="Years", ylab="PM2.5 emission from all sources")

