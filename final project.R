##### Gavin Andrews

#### Go to the US Census site (www.census.gov) and search for "2017 population estimates"
#### In your results, there will be a box with the population estimates for the U.S.
#### In that same box, there are links to population estimates by state 
#### Find a way to download these estimates 

# Step 1: import the 2017 state population estimates (you only want states) 
# into an R object called "uspop2017"
# Hint: there are 50 states so you should have 50 rows
# and two columns called "State" and "Population"
# Hint 2: Try locating and downloading a csv file and then use read.csv to import.
# You can also use the dropdown menu in RStudio to import your file 
# but be sure to copy your code from the console and paste below.
# You might need to open your file in a editor (notepad, Excel) 
# if it doesn't read in cleanly to figure out what is wrong and delete some rows.

library(readr)
uspop2017 <- read_csv("/Users/Gavand/Downloads/Population Estimates by State.csv")
View(uspop2017)

# Step 2: change the names of your variables to "state.name" and "pop2017" 

names(uspop2017)[names(uspop2017) == "Population Estimates by State"] <- "state.name"
names(uspop2017)[names(uspop2017) == "X2"] <- "pop2017"

# Step 3: find the three measures of central tendencymean(results$columnName, na.rm = TRUE) (a.k.a., ways to find the "average")
# for the "average" U.S. state population (mean, median, and mode (please read your text carefully about these))

uspop2017$pop2017 <- as.numeric(gsub("," ,"", uspop2017$pop2017))
new.mean <-  mean(uspop2017$pop2017,na.rm = TRUE)
print(new.mean)
# [1] 6328007
median(uspop2017$pop2017,na.rm = TRUE)
# [1] 4298482
uspop2017 <- uspop2017[-c(1, 54), ]
getmode(uspop2017$pop2017)
# [1] 4874747

# Step 4: There is a dataset called "state.area" already installed on your system. 
# Use ?state to learn more about this dataset and other state-based datasets.

?state
state.area

state.abb
state.center
state.division
state.name
state.region
state.x77

# Step 5: Note that the rows for this dataset are not labelled by state. 
# Those labels are in the state.name dataset.
# Combine the state.area and state.name datasets into one object.
state.namearea <- data.frame(state.name, state.area)
state.namearea

# Step 6: Merge this dataset with the uspop2017 dataset using state.name as the variable 
# to merge on. Make one data frame called uspop2017 with three variables: 
# state.name, pop2017, and state.area.
# Hint: you might need to turn your object into a date frame first.
uspop2017 <- uspop2017[-c(52), ] # Puerto Rico is not a state
uspop2017 <- uspop2017[-c(9), ] # DC is not a state (federal district)
uspop2017 <- data.frame(state.name, uspop2017$pop2017, state.area)

#  Step 7: Create a new variable called "popPerMile" as a column in your dataset that is 
# the number of people per mile for each state.
# Hint: you might need to change your state.area variable to numeric in order to accomplish this.
uspop2017$popPerMile <- uspop2017$pop2017 / uspop2017$state.area


#  Step 8: Write code to find the name of the most crowded state 
state.most <- uspop2017[which.max(uspop2017$popPerMile), ]
state.most$state.name
# [1] New Jersey

#  Step 9: Write code to find the name of the least crowded state 
state.least <- uspop2017[which.min(uspop2017$popPerMile), ]
state.least$state.name
# [1] Alaska

#  Step 10: Merge in the state.x77 dataset that is already installed on your system.
# Hint: you need to add the state.name column or turn the row.names into a column
# called "state.name" for merging
# You could throw caution to the wind and just cbind them since the row names
# will show you the merge was successful, but always be cautious about this!
# *Must convert object to a dataframe*
state.merge <- cbind(uspop2017, state.x77)
state.merge

#  Step 11: The 1975 "Population" variable in the state.x77 dataset is in the thousands.
# Create a new variable called "pop1975" that makes this an actual number that 
# can be compared to 2017
state.merge$pop1975 <- as.numeric(as.character(state.merge$Population))
state.merge$pop1975

# Step 12: Use code to find which state had the largest population increase (in numbers of people) 
# between 1975 and 2017. This will be similar to the steps laid out above.
state.merge$popIncrease <- state.merge$pop2017 - state.merge$pop1975
largestPopIncrease <- state.merge[which.max(state.merge$popIncrease), ]
largestPopIncrease$state.name
# [1] California

# Step 13: Find the variance of the 2017 population
var(state.merge$pop2017)
# [1] 5.395299e+13


# Step 14: Find the standard deviation of the 2017 population
sd(state.merge$pop2017)
# [1] 7345270

# Step 15: Let's pretend you are a researcher short on cash.
# You end up drawing a random sample of state populations.
# LEAVE THE LINE BELOW THIS ALONE. IT ENSURES OUR "RANDOM" RESULTS WILL BE THE SAME.

set.seed(42)

# First you draw just one state as a sample
sample(state.merge$pop2017, 1)
# [1] 8470020

# Step 16: Then draw 16 states as a sample, use replacement
# Hint: look at the options using ?sample to find the replacement option
sample(state.merge$pop2017, 16, replace = TRUE)


# Step 17: Take the mean of this 16 state sample
sample.mean <- sample(state.merge$pop2017, 16, replace = TRUE)
mean(sample.mean)
# [1] 6428374

# Step 18: Replicate that mean of a 16 state sample 100 times
replicate(100, mean(sample.mean))


# Step 19: Take the mean of those replications
mean(replicate(100, mean(sample.mean)))
# [1] 6583964

# Step 20: Take the mean of 1,000 replications of the mean of a 16 state sample
mean(replicate(1000, mean(sample.mean)))
# [1] 6508003

# Step 21: Compare the means for the 10 versus 1000 replications to the actual mean.
# Which is closer?
# Hint: take the mean of the entire 50 states' population first.
mean(state.merge$pop2017)
# The mean of the 1000 replications is closer.


# Step 22: Do a histogram of the 1000 replications. Note the shape of the histogram.
hist(replicate(1000, mean(sample.mean)))
# The shape of the histogram is normal distribution, by starting with small values increasing and decreasing
# back into small values

################## PART TWO #################
# Using the USArrests data on your system, answer the following question:
# Are arrest rates in 1973 related to changes in state populations from 1975 to 2017?
# You will need to create one violent crime variable.
# Feel free to use as many preliminary descriptive statistics as possible.
# 1) Be sure to include at least one statistical TEST that directly answers the question 
# (probably a correlation).
# 2) Be sure to include a GRAPH that also directly illustrates your answer 
# Hint: look at grouped graphs in your texts or on the www.statmethods.net site.
USArrests
violentCrime <- cbind(state.merge, USArrests)
violentCrime$violentState <- violentCrime$Murder + violentCrime$Assault + violentCrime$Rape
cor.test(violentCrime$violentState, violentCrime$popIncrease)

hist(violentCrime$violentState, violentCrime$popIncrease)
plot(violentCrime$violentState, violentCrime$popIncrease, main = "Arrests in 1973 and Change of Population in 2017",
     xlab = "1973 Violent Arrests", ylab = "Changes of Population up to 2017", cex.axis = .60, cex.main = .80)
lm(violentCrime$popIncrease ~ violentCrime$violentState)

################ PART THREE ###################
# Find a state-level characteristic at the U.S. Census to add to your dataset 
# Hint: try putting your state in the community facts here:
# https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml
# and see what kind of interesting things you can find.
# Analyze that new characteristic in the context of population or of 
# population changes. 
# 1) Be sure to conduct spome descriptive statistics. 
# 2) Be sure to include at least one statistical test that answers your question.
# 3) Be sure to include at least one graph that relates to your question.

# Import the median household in 2016 by state dataset
library(readr)
medianHouseholdIncome <- read_csv("/Users/Gavand/Downloads/ACS_16_5YR_GCT1901.US01PR/ACS_16_5YR_GCT1901.US01PR_with_ann.csv")
View(medianHouseholdIncome)

# Trim the dataset to bind match the state.merge 
medianHouseholdIncome <- medianHouseholdIncome[-c(1, 2, 11, 54), ]

# Merge household dollar to state.merge
state.merge <- cbind(state.merge, medianHouseholdIncome$HC01)

# Statistical test: Correlation on household income and the increase of US Arrests  
cor.test(state.merge$USArrests, state.merge$HC01)

# Graph: Potting the correlation for more a visual graph
plot(state.merge$USArrests, state.merge$HC01, main = "US Arrest Rates and Change in Household Income", 
     xlab = "US Arrest Rates", ylab = "Change in Household Income", cex.axis = .60, cex.main = .80)
