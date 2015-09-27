# Code Book for "run_analysis.R" file
## Variables Used:
* "columnNames" - dataset holding the "features.txt" file
* "activityType" - dataset holding the "activity_lables.txt"
* "activityTrain" - dataset holding the "y_train.txt"
* "subjectTrain" - dataset holding the "subject_train.txt"
* "dataTrain" - dataset holding the "x_train.txt"
* "activityTest" - dataset holding the "y_test.txt"
* "subjectTest" - dataset holding the "subject_text.txt"
* "dataTest" - dataset holding the "x_test.txt"
* "trainingDataset" - final data set for the training data
* "testDataset" - final data set for the test data
* "finalDataset" - total data set combining training data and the test data
* "colNames" - column names of the "finalDataset"
* "fData" - data set built by extracting the mean and standard deviation columns by fetching the required indices from "finalDataset"
* "tidyData" - tidy data set with the columnmeans of each of the columns for each Activity and for each Subject
