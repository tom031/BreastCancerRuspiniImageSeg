WBCdata = read.csv(c("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data"), header = FALSE)

head(WBCdata)
str(WBCdata)
#write.csv(datWBC,file="WBC.csv")


#fix colunm names
#colnames(dat) = c("sample_code_number", "clump_thickness", "uniformity_of_cell_size", "uniformity_of_cell_shape", "marginal_adhesion", "single_epithelial_cell_size", "bare_nuclei", "bland_chromatin", "normal_nucleoli", "mitosis", "classes")
#rename attributes "Id", "Cl.thickness", "Cell.size", "Cell.shape", "Marg.adhesion", "Epith.c.size", "Bare.nuclei", "Bl.cromatin", "Normal.nucleoli", "Mitosis", "Class"
colnames(WBCdata) = c("Id", "Cl.thickness", "Cell.size", "Cell.shape", "Marg.adhesion", "Epith.c.size", "Bare.nuclei", "Bl.cromatin", "Normal.nucleoli", "Mitosis", "Class")

head(WBCdata)

View(WBCdata[WBCdata == "?"])

library(DT)
datatable(dat[, c("Id", "Cl.thickness", "Cell.size", "Cell.shape", "Marg.adhesion", "Epith.c.size", "Bare.nuclei", "Bl.cromatin", "Normal.nucleoli", "Mitosis", "Class")])

summary(WBCdata$Bare.nuclei)


#check missing data
WBCdata.missing = WBCdata[WBCdata == "?"]

length(WBCdata.missing)
str(WBCdata$Bare.nuclei)
# impute missing data
library(mice)

WBCdata[, 2:10] = apply(WBCdata[, 2:10], 2, function(x) as.numeric(as.character(x)))
dataset_impute = mice(WBCdata[, 2:10], print = FALSE)
WBCdata = cbind(WBCdata[, 11, drop = FALSE], mice::complete(dataset_impute, 1))

#Change Class variables
WBCdata$Class = ifelse(WBCdata$Class == 2, "benign", ifelse(WBCdata$Class == 4, "malignant", NA))

WBCdata$Class = as.factor(WBCdata$Class)




# how many benign and malignant cases are there?
summary(WBCdata$Class)

#Set Class as Level
levels(WBCdata$Class)

str(WBCdata)

#summary data attributes
summary(WBCdata)
plot(WBCdata,)



summary(dat$classes)


summary(dat$clump_thickness)

summary(dat$uniformity_of_cell_shape)
summary(dat$uniformity_of_cell_size)
summary(dat$marginal_adhesion)
summary(dat$single_epithelial_cell_size)
summary(dat$bare_nuclei)
summary(dat$bland_chromatin)
summary(dat$normal_nucleoli)
summary(dat$mitosis)

#cov and cor
cov(dat)
write.csv(cov(dat), file = "cov.csv")
write.csv(cor(dat), file = "cor.csv")
#cor(dat)
pairs(dat)

library(corrplot)
corrplot(cor(dat[, -2]), order = "hclust")

