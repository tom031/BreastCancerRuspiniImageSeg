RUSdat = read.delim(c("c:/code_r/wisconsinbreastcancer/ruspinidataset/ruspini.csv"), sep = ",", header = FALSE)

head(RUSdat)
str(RUSdat)

colnames(RUSdat)=c("x","y")
str(RUSdat)

plot(RUSdat)

summary(RUSdat)