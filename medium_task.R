################################################
## Aim: To implement an efficient profile of 
## batchsize() function
################################################
set.seed(10)
library(mcmcse)
library(profvis)

# Function to generate AR(1) output, since AR(1) process is a Markov chain
make_AR1 <- function(n, X0, rho, tau) {
  x = numeric(n)
  x[1] = X0
  y = rnorm(n, sd = tau)
  x[2:n] = sapply(2:n, function(t) x[t] = rho*x[t-1] + y[t])
  return(x)
}


x = make_AR1(1e5, 0, 0.5, 1)

# Create an interactive widget for profiling the code
profvis({batchSize(x)})

