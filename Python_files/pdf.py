from scipy.stats import uniform, binom, norm



def pdf_uniform(x, a, b):
    """
    Calculates the probability density function (PDF) for a uniform distribution between 'a' and 'b' at a given point 'x'.
    """
    pdf = uniform.pdf(x, loc=a, scale=b - a)
    return pdf

def pdf_gaussian(x, mu, sigma):
    """
    Calculate the probability density function (PDF) of a Gaussian distribution at a given value.
    """

    pdf = norm.pdf(x, loc=mu, scale=sigma)

    return pdf


def pdf_binomial(x, n, p):
    """
    Calculate the probability mass function (PMF) of a binomial distribution at a specific value.
    """


    pdf = binom(n, p).pmf(x)

    return pdf


