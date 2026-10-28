#################################################
# IR 101: Getting Started with R and RStudio
#################################################



# Install Packages ----
# The command below installs the tidyverse package

install.packages("tidyverse")

# YOUR TURN ----
# Using the example above, write a command to install the janitor package




# Load packages ----
# This command loads the tidyverse library you just installed

library(tidyverse)

# YOUR TURN ----
# Write the command that loads the janitor library you just installed




# IMPORTING DATA ----
# The command below reads in a .csv file from Github 
# and saves it as a dataset called primarydata

primarydata <- read_csv("https://bit.ly/ir101data")

# EXPLORING YOUR DATA ----

# The command below previews your data in a spreadsheet format
view(primarydata)

# The command below displays the column names, data types, and sample values 
glimpse(primarydata)


# CLEANING UP COLUMN NAMES ----
# The command below cleans up the column names in your dataset
# and saves it to the same dataset
# clean_names() comes from the janitor package

primarydata <- clean_names(primarydata)


# YOUR TURN:
# Write the command to show you the new, cleaned up column names

glimpse(primarydata)


#################################################
# SELECT
# The command below selects the columns stid, age, gpa
# and saves it as a new dataset called subset1
#################################################

subset1 <- primarydata %>%
  select(stid,age,gpa)

# YOUR TURN:
# Write a command that select stid, ethnicity, and full_time
# and save it as a new dataset called subset2





#################################################
# FILTER
# The command below filters your primary data for students who identify as Asian
# and saves it as a new dataset called asian_students
#################################################

asian_students <- primarydata %>%
                    filter(ethnicity == "Asian")

# YOUR TURN:
# Filter your primary data for students who are Biology majors
# and save as a new dataset called biology_students




#################################################
# ARRANGE
# The command below sorts the age column in ascending order
# and saves it to the same primary data set
# arrange(variable) = ascending order
# arrange(desc(variable)) = descending order
#################################################

primarydata <- primarydata %>%
  arrange(age)



# YOUR TURN:
# In your primary dataset, sort GPA in descending order
# and save it into the same dataset





#################################################
# MUTATE
# The command below creates new variable called over_18
# and indicates whether a student is 18 or older
# and stores it into the same dataset
#################################################



primarydata <- primarydata %>%
  mutate(over_18 = age >= 18)



# YOUR TURN:
# Create a new variable called gpa_high
# that indicates if a student has a cumulative GPA of 3.5 or higher
# and store it into the same dataset








#################################################
# GROUP_BY + SUMMARIZE
# The command below counts the number of students
# in each major
#################################################

primarydata %>%
  group_by(major_desc) %>%
  summarize(
    Students = n()
  )

# YOUR TURN:
# Write a command that counts the number of students
# in each ethnicity





#################################################
# CHAINING VERBS TOGETHER
# The command below select multiple columns, filters for Psych students
# and sorts age in descending order
# saves to a new dataset called subset3
#################################################

subset3 <- primarydata %>%
  select(stid, age, ethnicity, gpa, major_desc) %>%
  filter(major_desc == "Psychology") %>%
  arrange(desc(age))

# YOUR TURN:
# Write a command that selects stid, major, sex, all sat scores
# filters for female students
# and sorts sat_verb in descending order









#################################################
# QUICK VISUALIZATION
#################################################

primarydata %>%
  count(ethnicity) %>%
  ggplot(
    aes(
      x = reorder(ethnicity, n),
      y = n
    )
  ) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Students by Ethnicity",
    x = "Ethnicity",
    y = "Number of Students"
  )

# Practice:
# Using the example above, create a chart showing students by gender