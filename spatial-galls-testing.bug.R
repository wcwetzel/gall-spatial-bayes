# spatial-galls.bug.R
# JAGS testing
# 4 Nov 2011
### this is to fit data from
### gall-spatial-sim.R
### see if I can recover simulated parms

model {
	
	for(i in 1:N) {
			galls[i] ~ dnegbin(p, r)
			lambdaNE ~ dmnorm( logmu, precV)
		}
		
		V <- pow(sigma, 2) * exp(1)^distcorr
		precV <- 1/V
		
		distcorr <- gamma * pow(D, 2)
		lambda <- exp(lambdaNE)
		p <- r / (r + lambda)
		r <- 0.5
		
		# priors
		sigma ~ dunif(0, 100)
		gamma ~ dunif(-10, 0)
		logmu <- log(mu)
		mu ~ dgamma(0.001, 0.001)
}

