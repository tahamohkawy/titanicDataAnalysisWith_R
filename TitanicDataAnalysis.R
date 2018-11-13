library(dplyr)
library(ggplot2)

#set the current working directoy
setwd("C:/Users/tabdalla/Desktop/Files/R/titanicR")

#load titanic data from the working directory
titanicData <- read.csv("TitanicData.txt")

str(titanicData)
+head(titanicData)

col_names <- c("PassengerId","Survived","Pclass","Name","Sex","Age","SibSp","Parch","Ticket","Fare","Cabin","Embarked","blank")

names(titanicData) <- col_names
names(titanicData)

str(titanicData)

#fitler by gender - females
females <- titanicData %>% filter(Sex == "female")
print(paste("Number of females: ",nrow(females)))

males <- titanicData %>% filter(Sex == "male")
print(paste("Number of males: ",nrow(males)))

#filter by status (survived, dead)
survivors <- titanicData %>% filter(Survived == 0)
print(paste("Number of survivors: ",nrow(survivors)))

dead <- titanicData %>% filter(Survived == 1)
print(paste("Number of dead: ",nrow(dead)))


#filter by gender and status
survived_females <- titanicData %>% filter(Survived == 0 & Sex == "female")
dead_females <- titanicData %>% filter(Survived == 1 & Sex == "female")

print(paste("Survived females: ",nrow(survived_females)))
print(paste("Dead females: ",nrow(dead_females)))


survived_males <- titanicData %>% filter(Survived == 0 & Sex == "male")
dead_males <- titanicData %>% filter(Survived == 1 & Sex == "male")

print(paste("Survived males: ",nrow(survived_males)))
print(paste("Dead males: ",nrow(dead_males)))

#filter by class
pclass_1 <- titanicData %>% filter(pclass_1 == 1)
pclass_2 <- titanicData %>% filter(pclass_1 == 2)
pclass_3 <- titanicData %>% filter(pclass_1 == 3)


#filter by status and class
survivors_pclass_1 <- titanicData %>% filter(pclass_1 == 1 & Survived == 0)
survivors_pclass_2 <- titanicData %>% filter(pclass_1 == 2 & Survived == 0)
survivors_pclass_3 <- titanicData %>% filter(pclass_1 == 3 & Survived == 0)


dead_pclass_1 <- titanicData %>% filter(pclass_1 == 1 & Survived == 1)
dead_pclass_2 <- titanicData %>% filter(pclass_1 == 2 & Survived == 1)
dead_pclass_3 <- titanicData %>% filter(pclass_1 == 3 & Survived == 1)



#Plot histogram for the age of passengers
titanicData %>% ggplot()+geom_histogram(aes(Age),binwidth = 10,na.rm = T)

#Plot histogram for the age of survivors
survivors %>% ggplot()+geom_histogram(aes(Age),binwidth = 10,na.rm = T)





