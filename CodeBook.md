This data extraction was made by Fredrik Emilsson (fredrik.emilsson@live.se). It is the project of the Getting and Cleaning Data course. It is based on a public data set that was downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

From that data mean and standard valuation columns was collected.  

Two data sets are included (complete_mean_and_std.csv and mean_per_activity_and_subject.csv). The columns are the same for both with the difference that in the first one all data is included but in the second one all means and standard deviation are the mean related to
each combination of (subject, activity).  

The columns are as follows:  

 [1] tBodyAcc.mean...X           tBodyAcc.mean...Y           tBodyAcc.mean...Z          
 [4] tBodyAcc.std...X            tBodyAcc.std...Y            tBodyAcc.std...Z           
 [7] tGravityAcc.mean...X        tGravityAcc.mean...Y        tGravityAcc.mean...Z       
[10] tGravityAcc.std...X         tGravityAcc.std...Y         tGravityAcc.std...Z        
[13] tBodyAccJerk.mean...X       tBodyAccJerk.mean...Y       tBodyAccJerk.mean...Z      
[16] tBodyAccJerk.std...X        tBodyAccJerk.std...Y        tBodyAccJerk.std...Z       
[19] tBodyGyro.mean...X          tBodyGyro.mean...Y          tBodyGyro.mean...Z         
[22] tBodyGyro.std...X           tBodyGyro.std...Y           tBodyGyro.std...Z          
[25] tBodyGyroJerk.mean...X      tBodyGyroJerk.mean...Y      tBodyGyroJerk.mean...Z     
[28] tBodyGyroJerk.std...X       tBodyGyroJerk.std...Y       tBodyGyroJerk.std...Z      
[31] tBodyAccMag.mean..          tBodyAccMag.std..           tGravityAccMag.mean..      
[34] tGravityAccMag.std..        tBodyAccJerkMag.mean..      tBodyAccJerkMag.std..      
[37] tBodyGyroMag.mean..         tBodyGyroMag.std..          tBodyGyroJerkMag.mean..    
[40] tBodyGyroJerkMag.std..      fBodyAcc.mean...X           fBodyAcc.mean...Y          
[43] fBodyAcc.mean...Z           fBodyAcc.std...X            fBodyAcc.std...Y           
[46] fBodyAcc.std...Z            fBodyAccJerk.mean...X       fBodyAccJerk.mean...Y      
[49] fBodyAccJerk.mean...Z       fBodyAccJerk.std...X        fBodyAccJerk.std...Y       
[52] fBodyAccJerk.std...Z        fBodyGyro.mean...X          fBodyGyro.mean...Y         
[55] fBodyGyro.mean...Z          fBodyGyro.std...X           fBodyGyro.std...Y          
[58] fBodyGyro.std...Z           fBodyAccMag.mean..          fBodyAccMag.std..          
[61] fBodyBodyAccJerkMag.mean..  fBodyBodyAccJerkMag.std..   fBodyBodyGyroMag.mean..    
[64] fBodyBodyGyroMag.std..      fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std..   
[67] subject                     activity  


Columns 1 to 66 are numbers  
Column 67 (subject) is an integer  
Column 68 (activity) is a Factor with six different values

 