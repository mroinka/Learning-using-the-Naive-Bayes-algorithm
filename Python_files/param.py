from estimate import estimate_uniform_params, estimate_gaussian_params, estimate_binomial_params



def find_params(class_name, feature):
    if feature == 'height' or feature == 'weight':
        mu, sigma = estimate_gaussian_params(class_name)
        return mu, sigma
    elif feature == 'bark_days':
        n, p = estimate_binomial_params(class_name)
        return n, p
    elif feature == 'ear_head_ratio':
        a, b = estimate_uniform_params(class_name)
        return a, b
    else:
        return None