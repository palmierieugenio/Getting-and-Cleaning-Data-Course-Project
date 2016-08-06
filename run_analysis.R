# complete.dataset() extract the files and execute these points:

# 1. Merges the training and the test sets to create one data set.

# I'm not sure if it's what you were expecting, but not understanding what was ID to use to merge the data,
# I've just combined the two data set with rbind(), because they had the same column dimensions.
# 
# 3. Uses descriptive activity names to name the activities in the data set:
# 4. Appropriately labels the data set with descriptive variable names. 

complete.dataset <- function(){
        files<-c('train//X_train.txt', 'test//X_test.txt', 'train//y_train.txt', 'test//y_test.txt', 'test//subject_test.txt', 'train//subject_train.txt', 'features.txt', 'activity_labels.txt')
        tables<-lapply(files,read.table)
        names(tables)<-c("train", "test", "train.labels", "test.labels", "subject.test", "subject.train", 'features', 'activity_labels')
        
        livelli<-as.character(tables$activity_labels$V2)
        
        trainlabels<-factor(tables$train.labels$V1,1:6,livelli)
        testlabels<-factor(tables$test.labels$V1,1:6,livelli)
        
        subjecttrain<-tables$subject.train$V1
        subjecttest<-tables$subject.test$V1
        
        train<-cbind(trainlabels,subjecttrain,tables$train)
        test<-cbind(testlabels,subjecttest,tables$test)
        names(train)[1:2]<-c("labels","subject")
        names(test)[1:2]<-c("labels","subject")
        
        complete<-rbind(train,test)
        
        features<-as.character(tables$features$V2)
        
        names(complete)[3:563]<-features
        
        complete
}

complete.dataset()->data

# justmeanstd() take the output of the previous function as input and:
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Using "grepl("mean",names(data))" I've included also the meanFreq() function, also if I wasn't sure,
# if it was what you want.

justmeanstd<-function(data){
        logic<-grepl("mean",names(data)) | grepl("std",names(data))
        logic[1:2]<-c(TRUE,TRUE)
        data[,logic]
}

justmeanstd(data)->data.meanstd

# splitmean() thake the output of the previous function as input and:
# 5. From the data set in step 4, creates a second,independent tidy data set
# with the average of each variable for each activity and each subject.
# I've used the labels and subjects as factors, I'm not completely sure if they were the rigth factors..

splitmean<-function(data.meanstd){
        label<-data.meanstd$labels
        subject<-data.meanstd$subject
        
        dataridotto<-data.meanstd[,-(1:2)]
        
        diviso<-split(dataridotto,f=list(label,subject))
        A<-sapply(diviso,colMeans)
        A
}

splitmean(data.meanstd)->data.split

# I write the output of splitmean in a file for my submission
write.table(data.split, "eugeniopalmieri_assignment.txt",row.name=FALSE)
