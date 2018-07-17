# Name: Gavin Andrews
# Date: 10/01/17

# 1
kobe.basket.prob <- prop.table(table(kobe$basket))
#  H         M
# 0.4360902 0.5639098

# 2
outcomes <- c("H")
sample(x = outcomes, size = 58, replace = TRUE)
# [1] "M" "M" "M" "H" "M" "H" "H" "M" "M" "M" "M" "M" "H" "M"
# [15] "M" "M" "H" "M" "H" "H" "M" "M" "M" "M" "H" "M" "M" "M"
# [29] "H" "M" "H" "M" "H" "H" "M" "H" "M" "H" "H" "H" "M" "M"
# [43] "H" "H" "H" "M" "H" "M" "H" "H" "H" "H" "H" "M" "H" "H"
# [57] "M" "H" "H" "M" "H" "H" "H" "M" "M" "M" "H" "H" "M" "M"
# [71] "M" "M" "H" "H" "H" "H" "M" "M" "H" "H" "H" "H" "M" "H"
# [85] "M" "H" "H" "M" "M" "H" "H" "M" "M" "M" "H" "M" "M" "M"
# [99] "M" "M" "H" "H" "H" "M" "H" "H" "M" "M" "M" "H" "M" "H"
# [113] "M" "M" "M" "M" "M" "H" "H" "H" "H" "M" "H" "H" "M" "H"
# [127] "H" "M" "M" "H" "M" "H" "H"

# 3
sample(kobe$basket[1:13])
calc_streak(sample(kobe$basket[1:13]))
# [1] "M" "H" "M" "M" "H" "M" "H" "M" "H" "H" "M" "M" "H"
# [1] 1 1 0 0 3 1 0 0
# This function calculates the streaks by frequency.
# The function says "if hit ("H"), count 1++,
# else count as 0.

# 4
barplot(table(calc_streak(sample(kobe$basket))))

# 5
sim_outcome <- sample(outcomes, size = 133, replace = TRUE)
# [1] "M" "M" "M" "H" "M" "H" "H" "M" "M" "M" "M" "M" "H" "M"
# [15] "M" "M" "H" "M" "H" "H" "M" "M" "M" "M" "H" "M" "M" "M"
# [29] "H" "M" "H" "M" "H" "H" "M" "H" "M" "H" "H" "H" "M" "M"
# [43] "H" "H" "H" "M" "H" "M" "H" "H" "H" "H" "H" "M" "H" "H"
# [57] "M" "H" "H" "M" "H" "H" "H" "M" "M" "M" "H" "H" "M" "M"
# [71] "M" "M" "H" "H" "H" "H" "M" "M" "H" "H" "H" "H" "M" "H"
# [85] "M" "H" "H" "M" "M" "H" "H" "M" "M" "M" "H" "M" "M" "M"
# [99] "M" "M" "H" "H" "H" "M" "H" "H" "M" "M" "M" "H" "M" "H"
# [113] "M" "M" "M" "M" "M" "H" "H" "H" "H" "M" "H" "H" "M" "H"
# [127] "H" "M" "M" "H" "M" "H" "H"



# 6
table(sim_outcome)
# H  M
# 64 69
# The shooter's probability differs from Kobe's by
# having a higher "H" than Kobe's and less "M".
# It should differ a little bit because it is a randomly
# generated sample.

# 7
calc_streak(sim_outcome)
barplot(calc_streak((sim_outcome)))
# [1] 2 1 0 0 1 0 2 0 0 0 1 3 0 1 0 0 0 0 1 0 0 1 0 2 0 0 0 1
# [29] 0 2 1 2 0 0 0 2 0 0 4 0 2 0 1 1 0 0 4 2 0 1 3 0 4 0 0 2
# [57] 0 0 2 2 3 0 0 1 1 0 0 2 1 5
# The sims barplot differs from Kobe's by being a lot lower.
# Kobe's streak is more becaue of how many he hit in a row.

# 8
table(calc_streak(sim_outcome))
table(calc_streak(kobe$basket))
#  0  1  2  3  4  5
# 37 14 12  3  3  1
# 0  1  2  3  4
# 39 24  6  6  1
# The probability distribution is similar to one another,
# the most they are off by is 10.

# 9
replicate(100, sample(calc_streak(sim_outcome), size = 1, replace = TRUE))
# [1] 0 1 2 0 0 0 1 0 0 3 0 1 0 1 0 1 2 0 3 0 0 3 0 1 0 1 4 0
# [29] 1 1 0 0 0 0 2 1 2 2 1 1 0 0 3 0 2 0 0 1 2 0 4 4 5 5 1 1
# [57] 0 0 0 1 1 0 2 2 0 0 0 0 0 1 3 1 0 0 2 0 0 1 0 0 0 3 0 0
# [85] 1 0 1 5 1 1 0 2 0 1 4 0 1 1 1 2
table(calc_streak(rep))
# Yes, Kobe's probability is typical because it is
# distributed with calc_streak

# 10
table(calc_streak(rep))
# 0
# 301
# Kobe will be equally likely of suuccessful shots
# compared to the simulated player because it
# calculates the best probability of a successful shot
# and Kobe's is similar.
