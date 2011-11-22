### testing likelihood for
### spatial hierarchical
# 4 Nov 2011

# 1st run gall-spatial-sim.R

library(emdbook)

k = 0.5
# nll for true model, assuming k is known

integrand = function(lambda, mu=mu){
	print(mu)
	dnbinom(galls, mu = lambda, size = k) * 
		exp(dmvnorm(lambda, mu=log(mu), Sigma=V))
}
nll = function(gamma, sigma, mu){
	V = sigma^2 * exp(-gamma * D^2)
	mu = mu
	print(mu)
	print(dim(V))
	integrate(integrand, 0, Inf)
}

#########

testi = function(x){
	dnorm(x, mean=a, sd=1)
}

l = function(a){
integrate(testi, -Inf, Inf)
}

l(1)