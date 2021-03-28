################################################
## Aim: To implement an efficient profile of 
## batchsize() function
################################################
set.seed(10)
library(mcmcse)
library(profvis)
source('hard_task.R')

# Function to generate AR(1) output, since AR(1) process is a Markov chain
make_AR1 <- function(n, X0, rho, tau) {
  x = numeric(n)
  x[1] = X0
  y = rnorm(n, sd = tau)
  for(i in 2:n) { 
    x[i] = rho*x[i-1] + Y[i]
  }

  return(x)
}


x = make_AR1(1e5, 0, 0.5, 1)

# Create an interactive widget for profiling the code
profvis({batchSize(x)})

# Using batchsize on Markov chain from the hard task.
n = 1e5
init = numeric(100)
h = 0.05
ans = RWMH(n, init, h)
profvis({batchSize(ans)})

# Function to generate VAR(1) output, since AR(1) process is a Markov chain
make_VAR1 <- function(n, X0, rho, tau) {
  p = length(X0)
  x = matrix(0, nrow = n, ncol = p)
  x[1,] = X0
  for(i in 2:n) { 
    x[i,] = rho %*% x[i-1,] + rnorm(p, sd = tau)
  }
  return(x)
}

# Increasing no of outputs in Markov chain and comparing results
p = 2
rho = 0.8*diag(p)
Xvar = make_VAR1(1e5, numeric(p), rho, 0.5)
profvis({batchSize(Xvar)})

Xvar = make_VAR1(1e6, numeric(p), rho, 0.5)
profvis({batchSize(Xvar)})

Xvar = make_VAR1(1e7, numeric(p), rho, 0.5)
profvis({batchSize(Xvar)})

# Increasing dimensions of Markov chain and comparing results
p = 500
rho = 0.8*diag(p)
Xvar = make_VAR1(1e5, numeric(p), rho, 0.5)
profvis({batchSize(Xvar)})
