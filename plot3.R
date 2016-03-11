library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d <- NEI %>% filter(fips=="24510") %>% group_by(year, type)
ggplot(data=d, aes(x=factor(year), y=Emissions, fill=type)) + geom_bar(stat="identity", position = "dodge")
