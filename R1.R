# Name: Gavin Andrews
# Date: 09/17/17

# 1
plot(x = cdc$weight, y = cdc$wtdesire, pch=19, col="#00AA0080")
# The relationship between the actual weight and the desired weight
# are similar to eachother. The desired weights are mostly low and
# everyone wants to be around 100-300 lbs.

# 2
cdc$wdiff <- cdc$weight - cdc$wtdesire
# If the wdiff is 0, that means that the actual weight is the
# same as the desired weight. If the wdiff is positive then the
# desired weight is less than the actual weight, if it is negative
# then the desired weight is more than the actual weight.

# 3
stripchart(cdc$wdiff)
mean(cdc$wdiff)
# [1] 14.5891
# The center of the wdiff distribution is at 15 because
# by finding the mean the average weight people want to lose is 15.

# 4
plot(cdc$wdiff, pch=19, col="#00AA0080")
# The shape and spread of the wdiff distribution is pretty even
# like a stroke of paint. The techniquesI used was using different
# pch to view the distribution more clearly.

# 5
# The center, the shape, and the spread of the wdiff distribution
# says that people are mostly comfortable about their weight and
# they would rather lose or gain just a littlt bit of weight.

# 6
plot(x = cdc$gender, y = cdc$wdiff)
# Women tend to desire to lose/gain a little weight while
# men desire to gain/lose more weight.

# 7
plot(cdc$wdiff, pch=19, col="#00AA0080")
# The outliers that look like an error are the one that desires
# to gain 200 and 400+.

# 8
mean(cdc$weight)
sd(cdc$weight)
# -4.20855583
# 4.25845482
# -4.18360633
# 4.28340431

# 9
mean(cdc$height)
sd(cdc$height)
# -16.2829978
# -15.7982614
mean(cdc$age)
sd(cdc$age)
# -2.56319692
# -2.50503266
