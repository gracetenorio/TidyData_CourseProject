### Introduction
This code book serves as a guide in understanding the tidy dataset **df_final.txt** produced by the script **run_analysis.R**.  For details on how we arrived at the tidy dataset, please consult the **README.md** file.


 
### Tidy Data Structure
The following describes the fields found in the tidy dataset **df_final.txt**:  

#### Identifiers and labels:
    
    * subject_id - identifier for the subject participating in the experiment (values: 1 to 30)  
    * activity   - label for the activities that a subject can perform 
                   (values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
    
   
#### Variables related to time domain signals measured in standardized units (-1 to 1):  
**(Note that these variables represent *average* values for a given subject and activity.)**
    
    * tBodyAcc.mean.X - mean body acceleration measured on the X-axis  
    * tBodyAcc.mean.Y - mean body acceleration measured on the Y-axis  
    * tBodyAcc.mean.Z - mean body acceleration measured on the Z-axis  

    * tBodyAcc.std.X - standard deviation of body acceleration measured on the X-axis  
    * tBodyAcc.std.Y - standard deviation of body acceleration measured on the Y-axis  
    * tBodyAcc.std.Z - standard deviation of body acceleration measured on the Z-axis  

    * tGravityAcc.mean.X - mean gravity acceleration measured on the X-axis  
    * tGravityAcc.mean.Y - mean gravity acceleration measured on the Y-axis   
    * tGravityAcc.mean.Z - mean gravity acceleration measured on the Z-axis     

    * tGravityAcc.std.X - standard deviation of gravity acceleration measured on the X-axis     
    * tGravityAcc.std.Y - standard deviation of gravity acceleration measured on the Y-axis      
    * tGravityAcc.std.Z - standard deviation of gravity acceleration measured on the Z-axis     

    * tBodyAccJerk.mean.X - mean body acceleration related to jerk movement measured on the X-axis     
    * tBodyAccJerk.mean.Y - mean body acceleration related to jerk movement measured on the Y-axis   
    * tBodyAccJerk.mean.Z - mean body acceleration related to jerk movement measured on the Z-axis   
    
    * tBodyAccJerk.std.X - standard deviation of body acceleration related to jerk movement measured on the X-axis 
    * tBodyAccJerk.std.Y - standard deviation of body acceleration related to jerk movement measured on the Y-axis 
    * tBodyAccJerk.std.Z - standard deviation of body acceleration related to jerk movement measured on the Z-axis 
                           
    * tBodyGyro.mean.X - mean velocity measured on the X-axis  
    * tBodyGyro.mean.Y - mean velocity measured on the Y-axis       
    * tBodyGyro.mean.Z - mean velocity measured on the Z-axis     
    
    * tBodyGyro.std.X - standard deviation of velocity measured on the X-axis  
    * tBodyGyro.std.Y - standard deviation of velocity measured on the Y-axis       
    * tBodyGyro.std.Z - standard deviation of velocity measured on the Z-axis    

    * tBodyGyroJerk.mean.X - mean velocity related to jerk movement measured on the X-axis  
    * tBodyGyroJerk.mean.Y - mean velocity related to jerk movement measured on the Y-axis  
    * tBodyGyroJerk.mean.Z - mean velocity related to jerk movement measured on the Z-axis  
    
    * tBodyGyroJerk.std.X - standard deviation of velocity related to jerk movement measured on the X-axis     
    * tBodyGyroJerk.std.Y - standard deviation of velocity related to jerk movement measured on the Y-axis 
    * tBodyGyroJerk.std.Z - standard deviation of velocity related to jerk movement measured on the Z-axis 
                                                         
    * tBodyAccMag.mean - mean body acceleration magnitude      
    * tBodyAccMag.std  - standard deviation of body acceleration magnitude        

    * tGravityAccMag.mean - mean gravity acceleration magnitude      
    * tGravityAccMag.std  - standard deviation of gravity acceleration magnitude    

    * tBodyAccJerkMag.mean - mean body acceleration magnitude related to jerk movement   
    * tBodyAccJerkMag.std  - standard deviation of body acceleration magnitude related to jerk movement   
    
    * tBodyGyroMag.mean - mean velocity magnitude     
    * tBodyGyroMag.std  - standard deviation of velocity magnitude    
    
    * tBodyGyroJerkMag.mean - mean velocity magnitude related to jerk movement  
    * tBodyGyroJerkMag.std  - standard deviation of velocity magnitude related to jerk movement  


#### Variables related to frequency domain signals measured in standardized units (-1 to 1):
**(Note that these variables represent *average* values for a given subject and activity.)**
    
    * fBodyAcc.mean.X - mean body acceleration measured on the X-axis    
    * fBodyAcc.mean.Y - mean body acceleration measured on the Y-axis     
    * fBodyAcc.mean.Z - mean body acceleration measured on the Z-axis  
    
    * fBodyAcc.std.X - standard deviation of body acceleration measured on the X-axis    
    * fBodyAcc.std.Y - standard deviation of body acceleration measured on the Y-axis    
    * fBodyAcc.std.Z - standard deviation of body acceleration measured on the Z-axis         
    
    * fBodyAccJerk.mean.X - mean body acceleration related to jerk movement measured on the X-axis    
    * fBodyAccJerk.mean.Y - mean body acceleration related to jerk movement measured on the Y-axis    
    * fBodyAccJerk.mean.Z - mean body acceleration related to jerk movement measured on the Z-axis    
    
    * fBodyAccJerk.std.X - standard deviation of body acceleration related to jerk movement measured on the X-axis    
    * fBodyAccJerk.std.Y - standard deviation of body acceleration related to jerk movement measured on the Y-axis    
    * fBodyAccJerk.std.Z - standard deviation of body acceleration related to jerk movement measured on the Z-axis    

    * fBodyGyro.mean.X - mean velocity on the X-axis    
    * fBodyGyro.mean.Y - mean velocity on the Y-axis    
    * fBodyGyro.mean.Z - mean velocity on the Z-axis    
    
    * fBodyGyro.std.X - standard deviation of velocity on the X-axis   
    * fBodyGyro.std.Y - standard deviation of velocity on the Y-axis   
    * fBodyGyro.std.Z - standard deviation of velocity on the Z-axis     
    
    * fBodyAccMag.mean - mean body acceleration magnitude   
    * fBodyAccMag.std  - standard deviation of body acceleration magnitude   

    * fBodyAccJerkMag.mean - mean body acceleration related to jerk movement    
    * fBodyAccJerkMag.std  - standard deviation of body acceleration related to jerk movement 
   
    * fBodyGyroMag.mean - mean velocity magnitude 
    * fBodyGyroMag.std  - standard deviation of velocity magnitude
    
    * fBodyGyroJerkMag.mean - mean velocity magnitude related to jerk movement
    * fBodyGyroJerkMag.std  - standard deviation of velocity magnitude related to jerk movement



### Further Resources
For a more detailed explanation of the variables above, including how they were derived and measured, please consult the [README](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) file from the UCI Machine Learning Repository website.

