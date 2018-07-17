# Name: Gavin Andrews
# Date: 09/24/17

# 1
boxPlot(heartTr$survtime)
# I believe there is 9 outliers when I view the boxPlot
# for the survtime column.

# 2
boxPlot(log(heartTr$survtime))
# When I log-transform heartTr$survtime, I no longer see
# outliers for the dataframe.

# 3
# The number of outliers change because when you log-transform
# the variable, it corrects the dataframe from any outliers.
# I believe the dataframe without the transform is a more accurate
# representation of the of the data because I does not rid of any
# useful data.

# 4
contTable(heartTr, prop = c("none", "survived", "transplant"), show = FALSE, digits = 3)
# Only 4 patients in the control group survived.

# 5
m <- matrix(heartTr, 8)
prop.table(m, 1)
# The patients in the treatment group were more likely to survive
# ove the patients in the control group.

# 6
prop.table(table(heartTr$id, heartTr$transplant))
# I would interpret this function by saying that it shows decimals rather than
# the variable.

# 7
count <- table(heartTr$acceptyear, heartTr$survived)
barplot(count, main="Raw Freq.", xlab="Years", col=c("darkblue", "red"), legend = rownames(count))
# The trend over time was that after 1 year of each treatment
# or control then the patient wouldn't survive.

# 8
legend = rownames(count)

# 9
count <- table(heartTr$acceptyear, heartTr$transplant)
barplot(count, main="Stacked Plot", xlab="Years", col=c("darkblue", "red"), legend = rownames(count))
# Over time the frequency in the treatment group grow but the years.

# 10
mosaicplot(heartTr, main = NULL, xlab = heartTr$acceptyear, ylab = heartTr$transplant, color = "darkblue")
# What you can see in the plot is different from the previous plots.
# The trend over time shows that the survival rate for the treatment
# group begins to grow over time.
