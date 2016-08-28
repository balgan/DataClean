## Start by creating the dataframes for both training and test set

df_training_xset <- read.table("UCI HAR Dataset\\train\\X_train.txt",header = FALSE)
df_training_yset <- read.table("UCI HAR Dataset\\train\\Y_train.txt",header = FALSE)
df_training_subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt",header = FALSE)
colnames(df_training_subject)[1]<- "subjectID"
colnames(df_training_yset)[1]<- "activityID"
df_train_final <- cbind(df_training_xset,df_training_yset,df_training_subject)




df_test_xset <- read.table("UCI HAR Dataset\\test\\X_test.txt",header = FALSE)
df_test_yset <- read.table("UCI HAR Dataset\\test\\Y_test.txt",header = FALSE)
df_test_subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header = FALSE)
colnames(df_test_subject)[1]<- "subjectID"
colnames(df_test_yset)[1]<- "activityID"
df_test_final <- cbind(df_test_xset,df_test_yset,df_test_subject)


# We use rbind as we merge vertically and both dataframes have same ammount of variables
df_merged <- rbind(df_train_final,df_test_final)


#load list of names
list_columnsnames <- read.table("UCI HAR Dataset\\features.txt",colClasses=c("NULL",NA))
list_columnsnames$V2 = gsub("mean\\(\\)",'Mean', list_columnsnames$V2)
list_columnsnames$V2 = gsub("std\\(\\)",'StandardDeviation', list_columnsnames$V2)
list_columnsnames$V2 = gsub("^f",'Frequency', list_columnsnames$V2)
list_columnsnames$V2 = gsub("^t",'Time', list_columnsnames$V2)

#set column names
colnames(df_merged)[1:561] <- list_columnsnames$V2


#We are only looking for mean and standard Deviation
toMatch <- c("Mean", "StandardDeviation","subjectID","activityID")

#create dataframe with just these two
df_with_mean_and_sd <- df_merged[ , grepl(paste(toMatch,collapse="|") , names( df_merged )) ]

#rename the activityID into their rightful names - we could make a better automated version of this if the labels were more
df_with_mean_and_sd$activityID <- factor(df_with_mean_and_sd$activityID, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


#melt the table and create the final tidy dataset
melted <- melt(df_with_mean_and_sd, id=c("subjectID","activityID"))
tidy <- dcast(melted, subjectID+activityID ~ variable, mean)
write.csv(tidy, "tidy-dataset.csv", row.names=FALSE)
