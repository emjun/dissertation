library(rTisane)

# Declare variables
# Person: Observational unit
person <- Unit(name = "person")
# Age: Continuous measure
age <- continuous(unit = person, "Age")
# Race, 5 categories: 
# White, Black/African American, American Indian or Alaska Native, Asian or Pacific Islander, Mixed Race
race <- categories(unit = person, "Race", cardinality = 9)
# Highest Education Completed, 5 ordered categories
edu <- categories(unit = person, "Education", order=list("Grade 12", "1 year of college", "2 years of college", "4 years of college", "5+ years of college"))
# Current Employment Status, 3 categories: N/A, Works for wage, Self-employed
employ <- categories(unit=person, "Employment", cardinality=2)
# Sex, 2 categories: Male, Female
sex <- categories(unit = person, "Sex",cardinality = 2)
# Income: Continuous measure
income <- continuous(unit = person, "Income")

# Construct a conceptual model
cm <- ConceptualModel() %>% 
  assume(causes(age, income)) %>% 
  assume(causes(race, income)) %>% 
  hypothesize(relates(edu, income)) %>%
  hypothesize(relates(age, edu)) %>% 
  hypothesize(relates(race, edu)) %>%
  hypothesize(relates(sex, edu)) %>%
  hypothesize(relates(employ, income)) %>%
  hypothesize(causes(sex, income)) %>% 
  interacts(race, sex, dv = income) %>% 
  interacts(age, edu, dv = income)

# Query for a statistical model
query(conceptualModel=cm, iv=edu, dv=income)