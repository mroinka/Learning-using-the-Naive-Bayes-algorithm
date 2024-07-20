 Learning-using-the-Naive-Bayes-algorithm
 Naive Bayes Learning Algorithm Project

 Overview
This project implements a simple learning process using the Naive Bayes algorithm. The project is part of the Engineering Statistics and Probability course taught by Dr. Moradian during the second semester of the 1402-1403 academic year.

The project aims to classify data using principles of conditional probability and Bayes' theorem. It involves two main phases: training and classification, and it has been implemented in both MATLAB and Python.

 Project Description
The Naive Bayes algorithm uses the following steps:

 Phase 1: Training
1. Input Data: A dataset \( X \) consisting of n-dimensional feature vectors and their corresponding classes.
2. Feature Distribution Calculation: For each feature and each class, the distribution of the features is calculated. The project deals with both continuous and discrete features:
    - Continuous Features: Assumed to follow Gaussian or Uniform distributions.
    - Discrete Features: Assumed to follow Binomial distributions.
3. Parameter Estimation: The parameters of these distributions are estimated from the training data.

 Phase 2: Classification
1. Input Data: New data samples to be classified.
2. Probability Calculation: The algorithm calculates the probability of the new sample belonging to each class based on the feature distributions obtained in the training phase.
3. Class Assignment: The sample is assigned to the class with the highest posterior probability.

 Implementation Details
 Continuous Features
- Dataset: csv.dogs
    - Features: height and weight (Gaussian distribution), days_bark (Binomial distribution), ratio_head_ear (Uniform distribution).

 Discrete Features
- Dataset: csv.emails
    - Features: Each word in an email is considered a feature.
    - Classes: spam and non-spam.

 Running the Project
 MATLAB
1. Training: Run the train_naive_bayes.m script to calculate feature distributions and parameters.
2. Classification: Run the classify_naive_bayes.m script to classify new data samples.

 Python
1. Training: Execute the train_naive_bayes.py script to calculate feature distributions and parameters.
2. Classification: Execute the classify_naive_bayes.py script to classify new data samples.

 File Structure
