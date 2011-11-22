# spatial galls
# R code to run JAGS model - testing
# 4 Nov 2011
### this is to fit data from
### gall-spatial-sim.R -- first run this!
### see if I can recover simulated parms
library(rjags)

N = nrow(d2)


jags = jags.model('spatial-galls-testing-pois.bug.R',
			data = list('galls' = galls,
							'N' = N,
							'D' = D),
				n.chains = 4,
				n.adapt = 100)

jags.samples(jags,
			c('mu'),
			1000)


