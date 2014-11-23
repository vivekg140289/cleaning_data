library("plyr")
fileurl1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   "
dest1<-"C:\\Users\\gvivek\\Documents\\cleaning_data\\data\\dataset.zip"
download.file(fileurl1,dest1,mode= "wb")
viv<-unzip(dest1)
trainingsetx<-read.table(viv[27])
trainingsety<-read.table(viv[28])
datsetx<-read.table(viv[15])
datasety<-read.table(viv[16])
combineddata1<-rbind(trainingsetx,datsetx)
combineddata2<-rbind(trainingsety,datasety)
combineddata<-data.frame(cbind(combineddata2,combineddata1))

features<-read.table(viv[2])
feature_index<-grep("mean\\(\\)|std\\(\\)",features$V2)
feature_index<-feature_index+1

extractdata<-combineddata[,feature_index]

activity<-read.table(viv[1])
combineddata$V1<-as.factor(combineddata$V1)
levels(combineddata$V1)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

colnames(combineddata)[1]<- "activity"
for (i in  2: length(colnames(combineddata)))
{
  colnames(combineddata)[i]<-as.character(features$V2[i-1])
  
}

subject_train<-read.table(viv[26])
subject_test<-read.table(viv[14])
row_bind<-rbind(subject_train,subject_test)
final_data<-cbind(row_bind,combineddata)



tidy_data<-data.frame(row.names=activity$V2)

for(j in 1:30)
{
  indexes<-final_data[which(as.integer(final_data[[1]])==j),]
  for (i in 3:length(colnames(final_data)))
  {
    
    temp<-tapply(indexes[,i],indexes[,2],mean)
    temp1<-data.frame(temp)
    tidy_data<-cbind(tidy_data,temp1)
    colnames(tidy_data)[(j-1)*(length(colnames(final_data))-2)+i-2]<-as.character(colnames(final_data)[i])
    
  }
  
  
}
write.table(tidy_data,file="C:\\Users\\gvivek\\Documents\\cleaning_data\\data\\final_project.txt")
