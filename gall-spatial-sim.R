# simulate spatially correlated gall data
# for plot 2, try to recover parms using JAGS
# 4 Nov 2011
library(MASS)

d2 = read.csv(
	'~/Documents/DATA/2010 DATA/FIELD/plot 2/plot2-2010-2011.csv')
d2 = d2[!is.na(d2$galls2010),]
d2$mgalls = with(d2, (galls2011 + galls2010)/2 )
d2$vol = with(d2, d1/100 * d2/100 * h/100) # cubic meters
d2$density = d2$galls2011/d2$vol


# expected number of galls per plant and sd:
mu.sim = 7.5
sigma.sim = 0.25

# other parms
gamma.sim = 0.5 # spatial extent of correlation
			# small gamma = large extent
size.sim = 0.5 # overdispersion parm in nbinom

# build a spatial correlation matrix
D = as.matrix(dist(cbind(d2$x, d2$y))) # distance matrix

V.sim = sigma.sim^2 * exp(-gamma.sim * D^2)


lambda.sim = exp(mvrnorm(n=1, mu=rep(log(mu.sim), 237), 
		Sigma=V.sim))
#gallsp = rpois(n = length(lambda), lambda=lambda)
galls = rnbinom(n = length(lambda.sim), 
				mu = lambda.sim, size=size.sim)
plot(d2$x, d2$y, cex=galls)
hist(galls)
