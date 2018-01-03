rm(list=ls())
#Taknig the R_dataset "iris"
iris
summary(iris)
#Checking the datatype of variables
str(iris)
set.seed(9850)
#Generating the random numbers from the uniform data to make iris data randomized
temp<-runif(150)
#ordering the data according to the rank of random numbers
iris<-iris[order(temp),]
#creating a function for normalizing the data
normalize<-function(x){
temp<-(x-min(x))/(max(x)-min(x))
return(temp)
}
#creating the test and training dataset from the iris dataset
iris_n<-as.data.frame(lapply(iris[,c(1:4)],normalize))
iris_train<-iris_n[1:129,]
iris_test<-iris_n[130:150,]
iris_train_target<-iris[1:129,5]
iris_test_target<-iris[130:150,5]
#Package required "class"
require(class)
#using KNN Algorithm to predict the category of the flower
m1<-knn(train=iris_train,test=iris_test,cl=iris_train_target,k=13)
table(iris_test_target,m1)
