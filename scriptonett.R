options(scipen=5)

#contribs <- read.csv("contribs_all_dump_14.01.2016.csv", header = TRUE, sep = "@", quote = "\"", dec = ".", fill = TRUE, comment.char = "", encoding="UTF-8")
contribs <- read.csv("contribs_all_tt.csv", header = TRUE, sep = "@", quote = "\"", dec = ".", fill = TRUE, comment.char = "", encoding="UTF-8")

#make times normal
contribs$timestamp2 <- as.POSIXct(contribs$timestamp, origin="1970-01-01")

#titles
titles <- c("Norra küberkaitse", "Norra kaitsevägi", "Norra kuninglik merevägi", "Norra kuninglikud õhujõud", "Ine Marie Eriksen Søreide", "Start (lennuk)", "2009. aasta satelliitide kokkupõrge", "Nikolaus von Falkenhorst", "Francis Gary Powers", "Pähkinäsaari rahu", "Nuorgam", "Drøbak", "Oslo fjord", "Oscarsborgi kindlus", "Drøbaki lahing", "Birger Eriksen", "2015. aasta iluuisutamise MM", "Dev Patel", "Eric Radford", "Euroopa Ülemkogu", "Gattšina", "Giovanni tuba", "Joachim Neander", "Korsika vabariik", "Ksenoon", "Lars Vilks", "Maria de Lourdes Pintasilgo", "Miguel I", "Märts 2015", "Peeter II", "Portugal", "Portugali president", "Soome Evangeelne Luterlik Kirik", "Soome Õigeusu Kirik", "Tordesillase leping", "Ülemsalanõukogu", "Liguuria vabariik", "Antonio Sant'Elia", "Genova doodž", "Simone Boccanegra", "Riviera", "Paolo Lucio Anafesto", "Lodovico Manin", "Genova doodžide palee", "Campo Formio rahu", "Ohete sild", "Giulino", "Cannaregio", "Dorsoduro", "Veneetsia geto", "Brunate Como-Brunate köisraudtee", "Burano", "Torcello", "Altinum", "Giudecca", "San Marco vabariik", "Lombardia köök", "Gorgonzola juust", "Gorgonzola vald", "Lido di Venezia", "Veneetsia rahu", "Legnano lahing", "Lukmanieri mäekuru", "Vaporetto", "Castello Baradello", "Como", "Quadrilatero", "Como toomkirik", "Desio lahing", "Murano", "Sant'Erasmo", "Fra Mauro", "Veneto lipp", "Gvelfid ja gibelliinid", "Veneta laguun", "Lombardia Liiga", "Roncaglia riigipäev", "Verona mark", "Dogado", "Stato da Mar", "Domini di Terraferma", "Itaalia Liiga", "Veneetsia doodž", "Bergamo", "Alessandro Grandi", "Bartolomeo Colleoni", "Vana Šveitsi Konföderatsiooni Alpide-tagused sõjakäigud", "Arbedo lahing", "Pietro II Orseolo", "Ferrara hertsogkond", "Obizzo II d'Este", "Desiderius", "Ticinum", "Valtellina", "Benevento hertsogkond", "Mediolanum", "Milano amfiteater", "Mediolanumi lahing", "Agri Decumates", "Horreum", "Benacuse järve lahing", "Aurelianuse müür", "Latiinide liit", "Regilluse järve lahing", "Sentinumi lahing", "Rooma kodusõjad", "Nelja keisri aasta", "Tiberi saar Itaalia 1629.–1631. aasta katkuepideemia", "Milano linnamüür", "Rooma seitse küngast", "Horrea Galbae", "Forma Urbis Romae", "Polesine", "Ferrara sõda", "Piazza del Duomo (Milano)", "Cinque Terre", "Pesto", "Moretum", "Bergamo toomkirik", "Via Aemilia", "Via Postumia", "Bellagio", "Psühhiaatriline reform Itaalias", "Historia Langobardorum", "Veneetsia sinjoriia", "Serviuse müür", "Spritz", "Caeliuse küngas", "Grana Padano", "Pazzi vandenõu", "Pisa vabariik", "Porto Pisano", "Pinakoteek", "Ratchis", "Sentinum", "Pilgrim (album)", "From the Cradle", "Riding with the King", "Kanada", "Friedrichshafen FF.41", "Sopwith Camel", "Glenn Greenwald", "Rodney King", "1992. aasta Los Angelese rahutused", "Fergusoni rahutused", "Eric Garner", "Trayvon Martin", "Emmett Till", "Tamir Rice", "NAACP", "Bernie Sanders", "Oswaldo Guayasamín", "Sufražett", "Emily Davison", "Ralph Miliband", "Russell Brand", "Owen Jones", "Henry Molaison", "Kent Cochrane", "Solomon Šereševski", "Sünesteesia", "Hüpnoos#Teadusuuringuid", "Imhotep", "Petra", "Nazca geoglüüfid", "Ulrich von Wilamowitz-Moellendorff", "Lucy", "Lady Duff-Gordon", "Holly Hunter", "Live Aid", "Bob Geldof", "Puy du Fou", "Patrick Pearse", "Lac la Ronge", "Y-põlvkond", "HeForShe", "Kaeveõõs", "Käsipala (kunst)", "Geoloogiline kompass", "Naiad", "Thalassa (kuu)", "Despina", "Galatea (kuu)", "Larissa (kuu)", "Nereid (kuu)", "Halimede (kuu)", "Jupiter", "Europa", "Eksoplaneet", "Protoplaneet", "Kuum Jupiter", "Polaarorbiit", "S. R. Ranganathan", "Aleksandria raamatukogu", "Lewise ja Clarki ekspeditsioon", "Segaviljelus", "Tasmaania", "Şabāḩ", "Malawi", "Wādī as-Salām", "Perito Moreno liustik", "Idi Amin", "Kõrvukrebane", "Lyndon B. Johnsoni Kosmosekeskus", "Kahvripühvel", "Mobutu Sese Seko", "2015. aasta juunioride iluuisutamise maailmameistrivõistlused", "Maksim Miroškin", "Lina Fjodorova", "2015. aasta juunioride jääkeegli maailmameistrivõistlused", "Yu Xiaoyu", "Jin Yang", "Anastassija Gubanova", "Radmila Šekerinska", "Walter Vitt")
            
            titles2 <-c( "Jan Kott", "Jaroslav Holík", "Jože Ciuha", "Gediminas Pranckūnas", "Imants Ziedonis", "Tinka Kurti", "Arthur Alekhsanjan", "İlham Zəkiyev", "Madita", "Zvjezdan Misimović", "Aliona Moon", "Paula Seling", "Branislav Nušić", "Čedo Vuković", "Lale Orta", "Maxim Tank", "Todor Kolev", "Šokan Uälihhanulõ", "Čazma", "Levan Tediashvili", "Evdokia Kadi", "János Arany", "Vürstipeegel", "James Krüss", "Rahvusvaheline astroloogiapäev", "Christine Nöstlinger", "Erich Kästner", "Rabapüü", "Pierre Bérégovoy", "Astrid Ivask", "Pär Nuder", "Jānis Kurelis", "Kindral Kurelise grupp", "Kristaps Upelnieks", "Presidendiloss (Helsingi)", "Kesäranta", "Valitsuse õhtukool", "Walter Runeberg", "Soome-neid", "Kristallpalee", "Politseiauto", "Hapnikuandur", "ABS-pidurid", "Turvapadi", "Johannes", "Rydzek", "Alessandro Pittin", "Kalevala luule", "Piiskop Henriku surmalaul", "Elina surm", "Kõuelind", "Kokko", "Põhjala emand", "Põhjala tütar", "Louhi (miiniveeskja", "1916)", "Iku-Turso (allveelaev", "1927)", "Sant", "lombakas ja pärispime", "Iku-Turso", "Baladas en español", "Iron Maiden (album)", "Running Free", "Live After Death", "Sanctuary", "Killers (Iron Maideni album)", "The Number of the Beast (album)", "Piece of Mind", "Powerslave", "Somewhere in Time", "Seventh Son of a Seventh Son", "No Prayer for the Dying", "Fear of the Dark", "The X Factor (album)", "Virtual XI", "Brave New World (Iron Maideni album)", "Iron Maiden (ka seonduv navmall ja pisimuudatusi mujal)", "Dance of Death", "A Matter of Life and Death", "The Final Frontier", "Eddie's Archive", "BBC Archives", "Beast over Hammersmith", "Best of the 'B' Sides", "Põhihariduse ministeerium Lõuna-Aafrika Vabariigis", "Nikolai Tupitsõn", "Balkani köök", "Marijan Haberle", "Naatriumpermanganaat", "Eko Yuli Irawan", "Gruusia köök", "Norra köök", "Uniform Memory Access", "Dasabuvir", "Henryk Hryniewski", "Vietnami köök", "Lõuna-Ameerika rannamängud", "Virtuaalne muuseum", "Operatsioon õnnistus", "Hronofoobia", "Ungari köök", "Charles Nicholl", "Gottfried Ploucquet", "Family Circle Cup 2014", "Wayne Gretzky 99 Award", "Frantisek Behounek", "Läti entsüklopeedia", "Arthur Elgort", "Computer Entertainment Rating Organization", "Pancetta", "Jayne Brook", "Sonya Yoncheva", "Bernard Beckett", "Soo määramine", "Toidutehnoloogia", "Ortofoto", "GIS-päev", "Kvaljeerperspektiiv", "Konnaperspektiiv", "Toidulisaained", "Mandlipiim", "Rahvusvaheline Raamatukoguühingute ja -institutsioonide Liit", "Läti Rahvusraamatukogu", "Elektrooniline kirjastamine", "Veebiarhiveerimine", "E-näitus")

#Take only articles from list
results <- contribs[contribs$title %in% c(titles,titles2),c('pageid','title','timestamp','userid','revid','user', 'size', 'sizediff', 'timestamp2')]

# write as csv
write.table(results, "results_tt.csv", sep = ";", fileEncoding = "WINDOWS-1252", row.names = TRUE, col.names = TRUE, quote= FALSE)

# aggregate and sum the diffs by person for total contribution
agg_results <- aggregate(sizediff~user,FUN=sum, data=results)

#write as csv
write.table(agg_results, "agg_results_tt.csv", sep = ";", fileEncoding = "WINDOWS-1252", row.names = TRUE, col.names = TRUE, quote= FALSE)




#############IRRELEVANT FROM HERE################


people <- read.csv("userlist.csv", header = TRUE, sep = ";", quote = "\"", dec = ".", fill = TRUE, comment.char = "")


merged <- merge(people,contribs, by.x="Kasutaja",by.y="user", all.y=TRUE)

concise <- merged[c("Kasutaja", "Aasta", "timestamp2")]

library(data.table)
merged_table <- data.table(merged)
merged_table["Kasutaja", "Aasta", "timestamp")]
merged_table$timestamp3 = as.Date(strptime(merged_table$timestamp2, "%Y-%m-%dT%H:%M:%S"))

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
