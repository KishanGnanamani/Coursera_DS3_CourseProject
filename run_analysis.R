#set working directory
setwd("./ds/ds3/data/UCI HAR Dataset");
library(plyr)

# Read the metadata files
columnNames     = read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)
# Read the training data files
activityTrain       = read.table('./train/y_train.txt',header=FALSE)
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
dataTrain       = read.table('./train/x_train.txt',header=FALSE)
# Read the test data files
activityTest       = read.table('./test/y_test.txt',header=FALSE)
subjectTest = read.table('./test/subject_test.txt',header=FALSE);
dataTest       = read.table('./test/x_test.txt',header=FALSE)

# Assigin column names to the activity meta data
colnames(activityType)  = c('activityId','activityType')
# Assigin column names to the training data
colnames(subjectTrain)  = "subjectId"
colnames(dataTrain)        = columnNames[,2] 
colnames(activityTrain)        = "activityId"
# Assign column names to the test data
colnames(subjectTest) = "subjectId"
colnames(dataTest)       = columnNames[,2] 
colnames(activityTest)       = "activityId"

# Create the training data set by combining activityTrain, subjectTrain, and dataTrain
trainingDataset = cbind(activityTrain,subjectTrain,dataTrain)

# Create the test data set by combining the activityTest,subjectTest and dataTest
testDataset = cbind(activityTest,subjectTest,dataTest);


# STEP 1 - Combining training and test data sets
finalDataset = rbind(trainingDataset,testDataset);

# STEP 2 - Extracting only the the mean and standard deviation columns for each measurement
colNames  = colnames(finalDataset); 
reqd_cols <- grep("-(mean|std)\\(\\)|(activityId|subjectId)", colNames) 
fData = finalDataset[,reqd_cols]

# STEP 3 - Using descriptive activity names to name the activities in the data set
fData = merge(fData,activityType,by='activityId',all.x=TRUE); # adding a new descriptive variable for activity by merging with activity meta data

# STEP 4 - Appropriately labelling the data set with descriptive variable names
colNames  = colnames(fData); 
# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","frequency",colNames[i])
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
    colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
    colNames[i] = gsub("AccMag","AccelerationMagnitude",colNames[i])
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccelerationJerkMagnitude",colNames[i])
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
    colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};
# Reassigning the new descriptive column names to the finalData set
colnames(fData) = colNames;

# STEP 5 - Creating tidy data set with the average of each variable for each activity and each subject
tidyData <- ddply(fData, .(subjectId, activityType), function(x) colMeans(x[, 1:68]))
write.table(tidyData, "tidyData.txt", row.name=FALSE)
