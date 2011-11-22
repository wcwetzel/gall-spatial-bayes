# pois-gamma 
# and suggestions from Marshall


model {
	
	for(i in 1:N) {
			galls[i] ~ dpois(lambda[i])
			lambda[i] ~ dgamma( r, mu)
			
			#predicted[i] ~ likelihood # predictions
		}
	
		
		# priors
		r ~ dunif(0, 100)
		mu ~ dunif(0.5,10)

}





