Algorithm
Initialize Steps:
  1. Set the Working Directory
  2. Load the "plyR" R-package
Preprocessing Steps:
  1. Load the meata data files
    a. features.txt - "columnNames"
    b. activity_lables.txt - "activityType"
  2. Load the training data files
    a. y_train.txt - "activityTrain"
    b. subject_train.txt - "subjectTrain"
    c. x_train.txt - "dataTrain"
  3. Load the test data files
    a. y_test.txt - "activityTest"
    b. subject_text.txt - "subjectTest"
    c. x_test.txt - "dataTest"
  4. Assign the column names to the loaded metadata dataset
  5. Assign the column names to the loaded training datasets
  6. Assign the column names to the loaded test datasets
  7. Create the final data set for the training data - "trainingDataset"
  8. Create the final data set for the test data - "testDataset"
Dataprocessing Steps:
  STEP 1. Combine the training dataset and the test dataset - "finalDataset"
    a. Create a new dataset "finalDataset" by rbinding "trainingDataset" and "testDataset" 
  STEP 2: Extract only the mean and standard deviation columns and store it in a dataframe - "fData"
    a. Assign the column names of the "finalDataset" to a variable "colNames"
    b. Get the indices of the mean and standard deviation along with the ActivityId and SubjectId columns from "colNames"
    c. Extract the mean and standard deviation columns by fetching the required indices from "finalDataset"
  STEP 3: Use descriptive activity names for each of the rows in the data set
    a. Merge the "fData" dataset with the "activityType" metadata dataset
  STEP 4: Use meaningfull descriptive column names
    a. Read through the Read.txt that came with the data download to understand the descriptiveness that needs to be provided. Ex - "t" needs to be elloborated as "time" 
    b. Assign the column names of the "fData" to a variable "colNames"
    c. Manipulate the "colNames" by providing descriptive names
    d. Assign the "colNames" variable as column names of "fData"
  STEP 5: Create tiday data set with the average of each variable for each activity and each subject
    a. Create a tidy dataset "tidyData" using the "ddply" function from the "plyR" package to get the columnmeans of each of the columns for each Activity and for each Subject
    b. Write the "tidyData" dataset to a file "tidyData.txt"
