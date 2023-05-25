pid <- Participant("ID")
age <- continuous(unit=pid, name="AGE")
edu <- categories(unit=pid, name="EDU", cardinality=10)
sex <- categories(unit=pid, name="SEX", cardinality=2)
income <- continuous(unit=pid, name="INCOME")

# Construct Conceptual Model
cm <- ConceptualModel() %>%
  assume(causes(age, income)) %>%
  hypothesize(relates(edu, income)) %>%
  hypothesize(relates(sex, income, when=equals(sex, 1.0), then=increases(income))) %>%
  interacts(sex, edu, income)

query(conceptualModel=cm, iv=edu, dv=income)