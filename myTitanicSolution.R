library(tidyr)
library(dplyr)

# 0: Load the data in RStudio
# Save the data set as a CSV file called titani_original.csv and load it in RStudio into a data frame.
tb <- tbl_df(read.csv(file="source/titanic_original.csv", header=TRUE, sep = ","))

tb$embarked <- gsub("^$","S",tb$embarked)

tb <- tb  %>% mutate(age = ifelse(is.na(age), mean(tb$age, na.rm = TRUE), age))

tb <- tb  %>% mutate(boat = ifelse(is.na(boat), NA,boat))

has_cabin <- case_when(tb$cabin == "" ~ 0, tb$cabin != "" ~ 1)

tb <- tb %>% mutate("has_cabin_number" = has_cabin)

write.csv(tb,file="titanic_clean.csv")

