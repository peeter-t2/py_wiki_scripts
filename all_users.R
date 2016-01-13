options(scipen=5)

contribs <- read.csv("allusers_20.csv", header = TRUE, sep = "@", quote = "\"", dec = ".", fill = TRUE, comment.char = "", encoding="UTF-8")

contribs$timestamp2 <- as.POSIXct(contribs$timestamp, origin="1970-01-01")


#people <- read.csv("userlist.csv", header = TRUE, sep = ";", quote = "\"", dec = ".", fill = TRUE, comment.char = "")


#merged <- merge(people,contribs, by.x="Kasutaja",by.y="user", all.y=TRUE)
merged <- contribs

#concise <- merged[c("Kasutaja", "Aasta", "timestamp2")]

library(data.table)
merged_table <- data.table(merged)
#merged_table["Kasutaja", "Aasta", "timestamp")]
merged_table$timestamp3 = as.Date(strptime(merged_table$timestamp2, "%Y-%m-%dT%H:%M:%S"))

table <- data.frame(timestamp = c(1,1,1,3,4,6), category= c("one", "two", "one", "one", "one", "one"))

library(zoo)
#add function to rolling average over unique within the timeframe...
merged$zoo_time <-zoo(merged$timestamp2)
rollapply(merged$timestamp, 1, FUN = function(x) unique(x)$maxdrawdownunique(merged$user))

data.zoo<- zoo(table)
data.zoo<- zoo(merged$user, merged$timestamp2)
time(data.zoo) <- as.yearmon(time(data.zoo))

length(unique(merged$user))
z <- zoo(merged)

rollapply(z, 3, function(x) length(unique(x["user"])), by.column = FALSE,   align = "left")

rollapply(table$category, 3, function(x) length(unique(x)), align = "left", partial = TRUE)

rolled <- rollapply(merged$user, 3, function(x) length(unique(x)), align = "left", partial = TRUE)
plot(rolled)

levels(merged$user) <- c("A","B","C","D","E","F","G","H","I","J","K","A","B","C","D","E")

dput(merged$timestamp)
dput(merged$user)

rollapply(data.zoo, 3, function(x) length(unique(x["user"])), by.column = FALSE,   align = "left")

rollapply(data.zoo$user, 3, function(x) length(unique(x)), align = "left", partial = TRUE) 

rollapply(data.zoo, 3, function(x) length(unique(x["category"])), by.column = FALSE,   align = "left")


plot(merged_table$timestamp2,rep(1, length(merged_table$timestamp2)), type= "h")
axis.Date(1,at=merged_table$timestamp3,labels=format(merged_table$timestamp3,"%b-%d"),las=2)


plot(merged$timestamp2,rep(1, length(merged$timestamp2)), type= "h")


merged[merged$timestamp2 < 2010]

merged$timestamp2[1]


#glu.density <- density(merged$timestamp2, from= 0, to=1, bw=0.1)
#plot(glu.density, xlab='Location in film-time', ylab='Density', main="1970s", col ="red", yaxt= 'n')

plot(merged$timestamp2[merged$Aasta == 2012],rep(1, length(merged$timestamp2[merged$Aasta == 2012])), type= "h")

plot(merged$timestamp2[merged$Aasta == 2013],rep(1, length(merged$timestamp2[merged$Aasta == 2013])), type= "h")

plot(merged$timestamp2[merged$Aasta == 2014],rep(1, length(merged$timestamp2[merged$Aasta == 2014])), type= "h")

plot(merged$timestamp2[merged$Aasta == 2015],rep(1, length(merged$timestamp2[merged$Aasta == 2015])), type= "h")


hist(merged$timestamp2[merged$Aasta == 2012], "months")
  

#aets <- as.xts(read.zoo("n8_energy_actual2009_2010.csv", header=TRUE, sep=",", FUN=as.POSIXct))
merged$zoo_time <-zoo(merged$timestamp2)
merged.2010 <- merged$zoo_time["2010-01::2010-10"]


merged.2015 <- merged[merged$timestamp2 >= as.POSIXlt("2015-10-01") & merged$timestamp2 < as.POSIXlt("2015-11-01"),]

merged.2015 <- merged[merged$Aasta == 2015 & (merged$timestamp2 < as.POSIXlt("2015-09-01") | merged$timestamp2 > as.POSIXlt("2015-12-25")),]

plot(merged.2015$timestamp2,rep(1, length(merged.2015$timestamp2)), type= "h")



merged.2014 <- merged[merged$Aasta == 2014 & (merged$timestamp2 < as.POSIXlt("2014-09-15") | merged$timestamp2 > as.POSIXlt("2014-12-25")),]
plot(merged.2014$timestamp2,rep(1, length(merged.2014$timestamp2)), type= "h")

hist(merged.2014$timestamp2, "months", freq=TRUE)
hist(merged.2015$timestamp2, "months", freq=TRUE)
merged.2013 <- merged[merged$Aasta == 2013,]


merged.cont <- merged[(merged$timestamp2 < as.POSIXlt("2015-09-01") | merged$timestamp2 > as.POSIXlt("2015-12-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2014-09-01") | merged.cont$timestamp2 > as.POSIXlt("2014-12-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2013-09-01") | merged.cont$timestamp2 > as.POSIXlt("2013-12-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2012-09-01") | merged.cont$timestamp2 > as.POSIXlt("2012-12-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2011-09-01") | merged.cont$timestamp2 > as.POSIXlt("2012-01-25")),]

hist(merged.cont$timestamp2, "months", freq=TRUE)
#http://stackoverflow.com/questions/10770698/understanding-dates-and-plotting-a-histogram-with-ggplot2-in-r
#http://stackoverflow.com/questions/8286763/monthly-time-series-in-r

#2004: https://et.wikipedia.org/wiki/Arutelu:Redoksreaktsioon


#http://stackoverflow.com/questions/4843969/plotting-time-series-with-date-labels-on-x-axis
#https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/axis.POSIXct.html


#https://www.google.ee/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=plot+events+time+on+horizontal+axis+r


#http://stackoverflow.com/questions/9053437/r-plot-with-an-x-time-axis-how-to-force-the-ticks-labels-to-be-the-days

merged.2013[merged.2013$Kasutaja %in% "RikkA",]
merged.2013[merged.2013$Kasutaja %in% "TJLill",] 

merged_table$title <- as.character(merged_table$title)
merged_table$Teema <- as.character(merged_table$Teema)

merged_not <- merged_table[!Teema %in% title]
"Hedgehog signaalirada" %in% "Hedgehog signaalirada222"

#[grepl(paste(unique(merged_table$Teema),collapse="|"), merged_table$Title)]
#grepl("cat|lion|tiger|panther", c("tiger", "animal"))
grepl(paste(unique(merged_table$Teema[merged_table$Teema != "" & !is.na(merged_table$Teema)]),collapse="|"), c("Rho-s?ltuv proteiinkinaas","NOagFG"))


merged_not <- merged_table[!grepl(paste(unique(merged_table$Teema[merged_table$Teema != "" & !is.na(merged_table$Teema)]),collapse="|"), merged_table$title),]


merged_not <- merged_not[!grepl(paste(c("Kasutaja","Vikipeedia"),collapse="|"), merged_not$title),]

merged_not <- merged_not[!grepl(paste(c("Liivakast"),collapse="|"), merged_not$Teema),]

#merged_not <- merged_not[!grepl(paste(c("Kasutaja","Vikipeedia"),collapse="|"), merged_not$title),]

#merged_not$title[merged_not$title=="Nixie toru"] 
#merged_not$title[merged_not$Teema=="Nixie toru"] 

#t?pit?htedega on ikka jama...

library(data.table)
set.seed(45L)
DT <- data.table(V1=c(1L,2L),
                 V2=LETTERS[1:3],
                 V3=round(rnorm(4),4),
                 V4=LETTERS[1:6])
DT$V2

DT[ V4 %in% V2] #$anywher in


grepl(paste(c("merged_table$Teema","A","B","C"),collapse="|"), c("Rho-sltuv proteiinkinaas","NOagFG"))


hist(merged_not$timestamp2, "months", freq=TRUE)
plot(merged_not$timestamp2,rep(1, length(merged_not$timestamp2)), type= "h")



uniques_merged <- merged_not[,(uniques=length(unique(title))), by = Kasutaja]
un2 <- uniques_merged[uniques_merged$V1 > 1,]


merged_not2 <- merged_not[grepl(paste(unique(un2$Kasutaja),collapse="|"), merged_not$Kasutaja),]
plot(merged_not2$timestamp2,rep(1, length(merged_not2$timestamp2)), type= "h")
hist(merged_not2$timestamp2, "months", freq=TRUE)



merged.cont <- merged_not2[(merged_not2$timestamp2 < as.POSIXlt("2015-09-01") | merged_not2$timestamp2 > as.POSIXlt("2015-12-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2014-09-01") | merged.cont$timestamp2 > as.POSIXlt("2015-01-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2013-09-01") | merged.cont$timestamp2 > as.POSIXlt("2014-01-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2012-09-01") | merged.cont$timestamp2 > as.POSIXlt("2013-01-25")),]

merged.cont <- merged.cont[(merged.cont$timestamp2 < as.POSIXlt("2011-09-01") | merged.cont$timestamp2 > as.POSIXlt("2012-01-25")),]




plot(merged.cont$timestamp2,rep(1, length(merged.cont$timestamp2)), type= "h")
hist(as.Date(merged.cont$timestamp2), "weeks", freq=TRUE, axes=T)
axis.Date(1, at=seq(as.Date("2004-01-01"), as.Date("2015-12-12"), by="2 weeks"),          format="%d %b %y")
axis.Date(1, at=seq(as.Date("2011-10-10"), as.Date("2012-03-19"), by="weeks"),         labels=F, tcl= -0.5)


plot.zoo(merged.cont$timestamp2)

library(scales)
library(ggplot2)
ggplot(merged.cont,aes(x=timestamp2, group=Kasutaja, fill=Kasutaja))+
  stat_bin(colour="black", binwidth=1, alpha=0.5,
           position="identity") + theme_bw()+
  xlab("Date of onset of symptoms")+
  ylab("Number of cases")+
  scale_x_date(breaks=date_breaks("1 month"), labels=date_format("%b %y"))


library(date)
hist(dat.geo$Date_of_Onset[(dat.geo$suburb=="x")], "weeks", 
     format = "%d %b %y", freq=T, col=rgb(0,0,0,1), axes=F, main="")
hist(dat.geo$Date_of_Onset[(dat.geo$suburb=="y")], "weeks", 
     format = "%d %b %y", freq=T, main="", col=rgb(1,1,1,.6), add=T, axes=F)
axis.Date(1, at=seq(as.Date("2011-10-10"), as.Date("2012-03-19"), by="2 weeks"),
          format="%d %b %y")
axis.Date(1, at=seq(as.Date("2011-10-10"), as.Date("2012-03-19"), by="weeks"), 
          labels=F, tcl= -0.5)



library(zoo)
plot(as.zoo(merged.cont$timestamp2), type = "h", xaxt = "n")
axis(1, unique(floor(time(merged.cont$timestamp2))))


library(scales)
library(ggplot2)
ggplot(merged.cont, aes(x=as.Date(merged.cont$timestamp2))) + 
  stat_bin(binwidth=1, position="identity") + 
  scale_x_date(breaks=date_breaks(width="1 month"))
