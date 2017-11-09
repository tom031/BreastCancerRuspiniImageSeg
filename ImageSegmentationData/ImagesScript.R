trainingDataUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/image/segmentation.data"
trainingData <- read.delim(trainingDataUrl, sep = ",", header = FALSE, skip = 5)
trainingDataHeaders <- read.delim(trainingDataUrl, sep = ",", header = FALSE, skip = 3, nrows = 1)
trainingDataHeaders <- cbind(V0 = "Label", trainingDataHeaders)
names(trainingData) <- unname(unlist(trainingDataHeaders[1,]))

head(trainingData)
str(trainingData)
attributes(trainingData)

## testing data
testingDataUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/image/segmentation.test"
testingData <- read.delim(testingDataUrl, sep = ",", header = FALSE, skip = 5)
testDataHeaders <- read.delim(testingDataUrl, sep = ",", header = FALSE, skip = 3, nrows = 1)
testDataHeaders <- cbind(V0 = "Label", testDataHeaders)
names(testingData) <- unname(unlist(testDataHeaders[1,]))

head(testingData)
str(testingData)

summary(testingData)
summary(trainingData)

