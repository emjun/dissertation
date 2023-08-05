import tea
tea.data('UScrime.csv')
variables = [
    {
        'name': 'So',
        'data type': 'nominal',
        'categories': ['0','1']
    },
    {
        'name': 'Prob',
        'data type': 'ratio',
        'range': [0,1]
    }
]
tea.define_variables(variables)

study_design = {
    'study type': 'observational study',
    'contributor variables': 'So',
    'outcome variables': 'Prob'
}
tea.define_study_design(study_design)

assumptions = {
    'groups normally distributed': [['So', 'Prob']],
    'Type I (False Positive) Error Rate': 0.05
}
tea.assume(assumptions)

hypothesis = 'So:1 > 0'
tea.hypothesize(['So', 'Prob'], hypothesis)