# One-sided comparisons
hypothesis = 'Region: Southern > Northern'
hypothesis = 'Region: Northern < Southern'

# Partial orders
hypothesis = 'Region: Southern > Southwest, Region: Northeast > Midwest'

# Two-sided comparisons
hypothesis = 'Region: Southern != Northern'

#Linear relationships
hypothesis = 'Imprisonment ~ Region'  # positive relationship
hypothesis = 'Imprisonment ~ - Region' # negative reltaionship

# Under development
hypothesis = 'Region: Southern > 1.5 * Northern'

tea.hypothesize(['Region', 'Imprisonment'], hypothesis)