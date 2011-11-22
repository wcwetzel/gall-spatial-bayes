# spatial galls
# R code to run JAGS model - testing
# 4 Nov 2011
### this is to fit data from
### gall-spatial-sim.R -- first run this!
### see if I can recover simulated parms
library(rjags)

N = length(galls)


jags = jags.model('pois-gamma.bugs.R',
			data = list('galls' = galls,
							'N' = N),
				n.chains = 4,
				n.adapt = 100)




