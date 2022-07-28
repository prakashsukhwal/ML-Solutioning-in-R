# call in the libraries

#install.packages("pacman")# run this only once if you do not have pacman package

pacman::p_load(tidyverse, caret, corrplot,car, relaimpo)

# set path to folder containing data on your computer
# I have set the directory on my computer using setwd() function

setwd("C:/Users/isspcs/Desktop/workshop-data")

# read the data file & inspect it's structure
cars = read.csv('cars.csv')

#set initial seed for reproducibility
set.seed(123)

# collect the data indices returned in a list
inds = createDataPartition(cars$Price, p=0.7, list=FALSE,times=1)

train_set = cars[inds,]

test_set = cars[-inds,]

# initial model with the transformed variables s_Age, s_KM
# train_set
model1 = lm(Price ~. , data = train_set)

model6 = stepAIC(model1)

# save your final
path = "D:/work/courses/SI-Solution Implementation/SI/code/R"
saveRDS(model6, file.path(path,"car_price.rds"))













