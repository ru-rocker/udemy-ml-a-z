# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')

dataset$Age = ifelse(test = is.na(dataset$Age),
                     yes = ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     no = dataset$Age
                     )

dataset$Salary = ifelse(test = is.na(dataset$Salary), 
                        yes = ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        no = dataset$Salary
                        )

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)