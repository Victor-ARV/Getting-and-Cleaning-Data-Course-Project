1. The data was organized first by binding the rows of features, activity and subjects for both testand train. The data is read and put into one variable. These variables are paired using r.bind.

   The columns of this data were merged into one whole data set (Data) and the column names were given according to the "feature.txt" file, columns corresponding to subjects and activitivies were given these names. Colname function is used to extract the names and to established the Data, column names.
   
2. From this whole dataset we worked only with the variables expressing mean and std. Using the grep function its easy to extract only those variables (columns) where the mean and std appears. In this step we also want to keep activies and subjects, since we will need it for the final tidy data.

3. The activities were rename with a descriptive name instead of numbers. With the factor function we can label each levelof interest we have the data and subsecuently subset these levels for each label we previously made in the data, by choosing the column where these levels are. 

4. Each variable was given its full name to make it fully descriptive.Using the gsub function, we can subset any value or letters specified with the sequence we want.  

5. Finally, this data set was group by activity and subject and only the average of these groups is printed. The arrange function lets us group the data into subsets, generate a statistics calculation. 
Once the data is organized how we wanted we just use the orden function to arrange the data in the way we visualized it from the beggining when we used the arrange funtion.   


Variables in code:

tax= "train/X_train.txt", the feature data corresponding to those volunteers that generated the traing data. 
tay= "train/y_train.txt", the activity data corresponding to those volunteers that generated the traing data. 
tas= "train/subject_train.txt", the subject data corresponding to those volunteers that generated the traing data. 

xte= "test/X_test.txt", the feature data corresponding to those volunteers that generated the test data. 
yte= "test/y_test.txt", the activity data corresponding to those volunteers that generated the test data. 
ste= "test/subject_test.txt", the subject data corresponding to those volunteers that generated the test data. 

features= all of the data corresponding to features.
activity= all of the data corresponding to activity.
subject= all of the data corresponding to subjects. <- rbind(tas, ste)

Data= all the data bind together. 
f= variable with the name of all the features or columns in data. read.table("features.txt")
a = the descriptive name of each activity and there corresponding number.
rmeanstd= are all the columns were mean|std appears. 
DataMS= is the data with only those columns were mean|std appears. 
DataMS2= is the data with only those columns were mean|std appears but with descriptive activities instead of numbers.  
DataMS3= A tidy data showing only means and grouped by subjects and activities.