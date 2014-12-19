### Introduction  
  
This repository contains files related to the *Getting and Cleaning Data* course project.  The goal of the project is to create a tidy dataset using data collected from a study involving wearable computing.  Details of the study can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) website.    
  
    
      
### Raw Data   
    
The data used for the analysis was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  It was then unzipped, creating a directory called "UCI HAR Dataset" which contains the following files and sub-directories:

* **files**:            activity_labels.txt, features_info.txt, features.txt, README.txt                         
* **sub-directories**:  train, test

Below is a description of the **files**:  
    
    1. activity_labels.txt - mapping of activity IDs to activity description
    2. features_info.txt   - description and explanation of how features were derived
    3. features.txt        - list of features
    4. README.txt          - explanation of experiment and relevant files
    
Below is a description of the **sub-directories**:

The "train" and "test" sub-directories contain data related to the subjects, activities performed, as well as measurements associated with these activities.  Detailed information on these files are listed below:    
  
  
File Name                              |            Description              |    Values      
-------------------------------------- | ------------------------------      | -----------------------------
subject_train.txt, subject_test.txt    |  identifier for each subject        | 1 to 30
y_train.txt, y_test.txt                |  identifier for each activity       | 1 to 6
X_train.txt, X_test.txt                |  acceleration and velocity measures | -1 to 1 (standardized)  

        
       
### Data Processing   
  
An R script called "run_analysis.R" was created in order to load and manipulate the data.  The following steps were taken in order to create a tidy dataset:    
    
    1.  Load training and test measurement data "X_train.txt" and "X_test.txt"    
    2.  Load features data "features.txt" and use it as variable names for the dataset created in Step 1  
    3.  Identify variables related to mean and standard deviation measurements (see "Rationale" below)  
    4.  Subset dataset to include only variables identified in Step 3  
    5.  Clean up variable names (see "Rationale" below)  
    6.  Load subject data "subject_train.txt" and "subject_test.txt"  
    7.  Load activity data "y_train.txt" and "y_test.txt" and create appropriate labels as defined in "activity_labels.txt"
    8.  Combine subject, activity and measurement datasets together  
    9.  Aggregate data at the subject and activity level and compute mean for each variable  
    10. Export tidy dataset from Step 9 to a text file         
   
### Rationale
##### Identifying variables related to mean and standard deviation measurements
These measures have been interpreted as any field containing the strings "mean()" and "std()".  For the sake of consistency (ie: both "mean()" and "std()" contain parentheses), other fields containing the string "Mean", but are not followed by parentheses, were not selected.

##### Variable clean-up strategy
* The prefixes "t" for "time" and "f" for "frequency" were left unchanged in order to avoid having very long variable names.  

* Strings "-mean()-" and "-std()-" were recoded as ".mean." and ".std." respectively in order to simplify and shorten variable names.  

* The following variable names contain duplicate instances of the string "Body":
        
        1. fBodyBodyAccJerkMag-mean()    
        2. fBodyBodyAccJerkMag-std()    
        3. fBodyBodyGyroMag-mean()    
        4. fBodyBodyGyroMag-std()    
        5. fBodyBodyGyroJerkMag-mean()    
        6. fBodyBodyGyroJerkMag-std() 
    
These were cleaned up so that only one instance of the string "Body" appears in the variable name.
           
         
### Tidy Data   

The result of this analysis is a tidy dataset that satisfies the conditions for "tidy data" as discussed in Jeff Leek's lecture "[Components of Tidy Data](https://class.coursera.org/getdata-016/lecture/7)".  In particular, the tidy dataset produced satisfies the following conditions:  
    
    1. Each variable is in one column.   
    2. Each different observation of that variable is in a different row.
    
In this case, an observation is defined as a combination of subject and activity.

The tidy dataset has been exported to a text file called "final_df.txt" and can be read back in to R using the following command:
        
    dat <- read.table("df_final.txt", header=TRUE)            
  

### Code Book
A code book called "Codebook.md" has been created in order to explain the variables found in the tidy dataset "df_final.txt".


















