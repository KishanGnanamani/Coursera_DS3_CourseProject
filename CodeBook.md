#Algorithm for "run_analysis.R'
##Initialize Steps:
  * Set the Working Directory
  * Load the "plyR" R-package
###Preprocessing Steps:
  * Load the meata data files
    1. features.txt - "columnNames"
    2. activity_lables.txt - "activityType"
  * Load the training data files
    1. y_train.txt - "activityTrain"
    2. subject_train.txt - "subjectTrain"
    3. x_train.txt - "dataTrain"
  * Load the test data files
    1. y_test.txt - "activityTest"
    2. subject_text.txt - "subjectTest"
    3. x_test.txt - "dataTest"
  * Assign the column names to the loaded metadata dataset
  * Assign the column names to the loaded training datasets
  * Assign the column names to the loaded test datasets
  * Create the final data set for the training data - "trainingDataset"
  * Create the final data set for the test data - "testDataset"
####Dataprocessing Steps:
  * STEP1 - Combine the training dataset and the test dataset - "finalDataset"
    1. Create a new dataset "finalDataset" by rbinding "trainingDataset" and "testDataset" 
  * STEP2 - Extract only the mean and standard deviation columns and store it in a dataframe - "fData"
    1. Assign the column names of the "finalDataset" to a variable "colNames"
    2. Get the indices of the mean and standard deviation along with the ActivityId and SubjectId columns from "colNames"
    3. Extract the mean and standard deviation columns by fetching the required indices from "finalDataset"
  * STEP 3: Use descriptive activity names for each of the rows in the data set
    1. Merge the "fData" dataset with the "activityType" metadata dataset
  * STEP 4: Use meaningfull descriptive column names
    1. Read through the Read.txt that came with the data download to understand the descriptiveness that needs to be provided. Ex - "t" needs to be elloborated as "time" 
    2. Assign the column names of the "fData" to a variable "colNames"
    3. Manipulate the "colNames" by providing descriptive names
    4. Assign the "colNames" variable as column names of "fData"
  * STEP 5: Create tiday data set with the average of each variable for each activity and each subject
    1. Create a tidy dataset "tidyData" using the "ddply" function from the "plyR" package to get the columnmeans of each of the columns for each Activity and for each Subject
    2. Write the "tidyData" dataset to a file "tidyData.txt"
