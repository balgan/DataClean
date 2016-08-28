## Code Book

This code book will describe the data used in this project, and the process we went throught to create the tidy data set that can be seen on the file named "tidy-dataset.csv"

### Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Explanation of each file


- 'README.txt' - contains description of entire repo

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'tidy-dataset.csv': A clean and tidy dataset with data per subject and per activity with the averages across all variables from both the training and test dataset combined

### Data files that were not used

This analysis was performed using only the files above, and did not use the raw signal data found in the "Inertial Signals" folders.

### Processing steps

1. All of the used data files were read into data frames, appropriate column headers were added
2. Data sets were merged into a single data set
3. All feature columns were removed that did not contain the exact string "mean()" or "std()", we also kept subjectID and activityID columns.
3. Appropriate naming was given to the values in activityID by converting the values from numeric into factors, using the descriptions of activities in the activity_labels.txt file.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. 
5. The tidy data set was written to a CSV file named "tidy-dataset.csv".