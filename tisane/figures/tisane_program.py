import tisane as ts

# Variable declarations
adult = ts.Unit("member")
motivation = adult.numeric("motivation")
pounds_lost = adult.numeric("pounds_lost")
group = ts.Unit("group")
condition = group.nominal("regimen_condition") # control vs. treatment
# Variable relationships
condition.causes(pounds_lost)
motivation.associates_with(pounds_lost)
adult.nests_within(group)
# Query Tisane for a statistical model
des = ts.Design(dv=pounds_lost, ivs=[condition, motivation]).assign_data("data.csv")
ts.infer_model(design=des)
