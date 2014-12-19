# --------------------------------------------------------------------------------------
#
# run_analysis.R:  This script collects, manipulates and produces a tidy dataset using
#                  data from the accelerometer and gyroscope of the Samsung Galaxy S 
#                  smartphone.
#
# --------------------------------------------------------------------------------------

# This script assumes that the working directory is the "UCI HAR Dataset" directory,
# which is produced after unzipping the original project file.  This directory contains 
# the following files and sub-directories: 
# files:           activity_labels.txt, features_info.txt, features.txt, README.txt
# sub-directories: test, train


# Step 1:  Load training and test measurement data, then combine into one dataset.
train <- read.table("train/X_train.txt")
dim(train)    # 7352 x 561 
head(train)

test <- read.table("test/X_test.txt")
dim(test)     # 2947 x 561        
head(test)

comb <- rbind(train,test)
dim(comb)     # 10299 x 561
head(comb)  



# Step 2:  Load features and use them to label columns in the "comb" dataset.
#          This will allow for easier extraction of the mean and standard 
#          deviation-related fields in Step 3 below.
feat <- read.table("features.txt")
dim(feat)         # 561 x 2
head(feat)

# transform feature names into a character vector
feat_tr <- as.character(t(feat$V2))
length(feat_tr)   # 561
head(feat_tr)

# change variable names in dataset "comb" to variables in feat_tr
colnames(comb) <- feat_tr
dim(comb)         # 10299 x 561
head(comb)



# Step 3:  Extract only variables representing mean and standard deviation measures.
#          These measures have been interpreted as any field containing the strings
#          "mean()" and "std()".  For the sake of consistency (ie: both "mean()" and 
#          "std()" contain parentheses), other fields containing the string "Mean" 
#          are not selected.
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", feat_tr)

# subset "comb" dataset to include only the column indices in mean_std_cols
comb2 <- subset(comb, select=mean_std_cols)
dim(comb2)     #10299 x 66
head(comb2)

# clean-up column names as follows:
#    1. replace "-mean()-" with ".mean." and "-std()-" with ".std."
#    2. remove duplicate instances of the string "Body" in the following columns:
#         fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std(), fBodyBodyGyroMag-mean(),   
#         fBodyBodyGyroMag-std(), fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std() 
#
# note that the prefixes "t" (for time) and "f" (for frequency) are being retained so as
# not to have overly lengthy field names.
names(comb2) <- sub("\\(\\)", "", names(comb2))
names(comb2) <- gsub("-", ".", names(comb2))
names(comb2) <- gsub("BodyBody", "Body", names(comb2))



#  Step 4:  Load subject data for both training and test datasets
subj_train <- read.table("train/subject_train.txt")
dim(subj_train)    # 7352 x 1
head(subj_train)

subj_test <- read.table("test/subject_test.txt")
dim(subj_test)     # 2947 x 1
head(subj_test)

# combine the two subject datasets and rename column
subj_comb <- rbind(subj_train, subj_test)
dim(subj_comb)     # 10299 x 1
head(subj_comb)

names(subj_comb)[1] <- "subject_id"



#  Step 5:  Load activity labels for both training and test datasets.
train_act_lab <- read.table("train/y_train.txt")
dim(train_act_lab)       # 7352 x 1
unique(train_act_lab)

test_act_lab <- read.table("test/y_test.txt")
dim(test_act_lab)        # 2947 x 1
unique(test_act_lab)

# combine the two activity labels datasets and rename column 
comb_act_lab <- rbind(train_act_lab, test_act_lab)
dim(comb_act_lab)        # 10299 x 1
names(comb_act_lab)[1] <- "activity_id"

# Create descriptive labels for each "activity_id".  Label "ERROR" is put in place as
# a way to check that "activity_id" was mapped correctly (ie: we should not see any 
# labels called "ERROR".)
comb_act_lab$activity <- ifelse(comb_act_lab$activity_id==1, "WALKING",
                         ifelse(comb_act_lab$activity_id==2, "WALKING_UPSTAIRS",
                         ifelse(comb_act_lab$activity_id==3, "WALKING_DOWNSTAIRS",
                         ifelse(comb_act_lab$activity_id==4, "SITTING",
                         ifelse(comb_act_lab$activity_id==5, "STANDING",
                         ifelse(comb_act_lab$activity_id==6, "LAYING", "ERROR"))))))

table(comb_act_lab$activity_id, comb_act_lab$activity)

# drop the "activity_id" field as it is no longer required
comb_act_lab$activity_id <- NULL



# Step 6:  Combine subject, activity and mean/std measurement datasets together.
df <- cbind(subj_comb, comb_act_lab, comb2)
dim(df)      # 10299 x 68
head(df)



# Step 7:  Aggregate at subject and activity level and compute average mean and standard
#          deviation for each measure.
df2 <- aggregate(df[,3:68],by=list(df$subject_id, df$activity), mean)

# rename the first 2 columns
names(df2)[1] <- "subject_id"
names(df2)[2] <- "activity"

# order dataset so that all 6 activities related to a given subject are displayed together
df_final <- df2[order(df2$subject_id, df2$activity),]
head(df_final,10)

# At this point, we have a tidy dataset as it satisfies the following conditions:
#    1. each variable is in one column 
#    2. each different observation of that variable is in a different row
#       (here an observation is defined at the subject and activity level)



# Step 8:  Export tidy dataset.
write.table(df_final, "df_final.txt", row.names=FALSE)






