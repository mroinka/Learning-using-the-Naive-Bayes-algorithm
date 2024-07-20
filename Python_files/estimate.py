import numpy as np
def estimate_gaussian_params(sample):

    mu = np.mean(sample)
    sigma = np.std(sample, axis=0)

    return mu, sigma


def estimate_binomial_params(sample):
    n = 30
    p = (sample / n).mean()

    return n, p


def estimate_uniform_params(sample):
    a = sample.min()
    b = sample.max()
    return a, b
