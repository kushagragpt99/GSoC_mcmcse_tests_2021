# GSoC_mcmcse_tests_2021
Tests for the GSoC project 'Critical efficiency improvements of mcmcse', under R stats

## Test 1
Easy: (1) Download the mcmcse package from CRAN and use the function `ess` on a vector `foo` of length 1e4 randomly drawn from a standard normal distribution.   
(2) Make a random matrix of size 10 x 10 and produce _only_ the eigenvalues of the matrix.

## Test 2
- Medium: Implement an efficiency profile of the `batchSize()` function using `profvis`. Do this for varying sizes of input matrices.

## Test 3
- Hard: Write a code for a random walk Metropolis-Hastings algorithm to sample from a 100 dimensional standard normal Gaussian distribution. Focus on efficient implementation of this code. (2) Calculate the effective sample size as described in [this paper](https://arxiv.org/pdf/1512.07713.pdf) in a way that is numerically stable, and does not utilize any inbuilt functions. **Make sure you write your own function for this**.

