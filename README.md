Step 1: the zip file is downloaded from URl using download.file
Step 2: training set and data set are read into R
Step 3: training set and data set are combined using cbind to get combineddata variable.
Step 4: Features are read into features variable
Step 5: row indices in which mean and STD of features are computed is extracted using grep function
Step 6: "extractdata" variable is a obtained by subsettting "combineddata" variable. It has columns corresponding to features extracted in Step 5.This is solution to question 2.
Step 7: Different activities by subjects are read into "activity" variable
Step 8: descriptive activity names are provided by converting the column corresponding to activity in "combineddata" as a factor and renaming it.
Step 9: Various features extracted from daa is stored in "features"v variable
Step 10:Descriptive variable names are provided by allocating the feature name to each colun using for loop.
Step 11:information aou the subjec is obtained by concatenating subject info to "combineddata"
Step 12:final tidy data is obtained in two steps. In first step , I extract the row numbers corresponding to the same subjects. in the second step ,I extract mean with respect to levels of activity .
         This is repeated across all subjects and all features to obtain final data