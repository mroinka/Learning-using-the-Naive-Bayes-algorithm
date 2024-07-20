import pandas as pd


emails = pd.read_csv('../data/emails.csv')

def process_email(text):
    text = text.lower()
    return list(set(text.split()))


emails['words'] = emails['text'].apply(process_email)


def word_freq_per_class(df):
    word_freq_dict = {}
    for _, row in df.iterrows():
        for word in row['words']:
            if word not in word_freq_dict:
                word_freq_dict[word] = {'spam': 0, 'ham': 0}

            match row['spam']:
                case 0:
                    word_freq_dict[word]['ham'] += 1
                case 1:
                    word_freq_dict[word]['spam'] += 1

    return word_freq_dict


word_freq = word_freq_per_class(emails)
print(f"Frequency in both classes for word 'lottery': {word_freq['lottery']}\n")
print(f"Frequency in both classes for word 'sale': {word_freq['sale']}\n")

try:
    word_freq['asdfg']
except KeyError:
    print("Word 'asdfg' not in corpus")


def class_frequencies(df):

    class_freq_dict = {
        "spam": len(df[df['spam'] == 1]),
        "ham": len(df[df['spam'] == 0])
    }

    return class_freq_dict

class_freq = class_frequencies(emails[:10])
print(f"Small dataset:\n\nThe frequencies for each class are {class_freq}\n")
print(f"The proportion of spam in the dataset is: {100*class_freq['spam']/len(emails[:10]):.2f}%\n")
print(f"The proportion of ham in the dataset is: {100*class_freq['ham']/len(emails[:10]):.2f}%\n")

class_freq = class_frequencies(emails)
print(f"\nFull dataset:\n\nThe frequencies for each class are {class_freq}\n")
print(f"The proportion of spam in the dataset is: {100*class_freq['spam']/len(emails):.2f}%\n")
print(f"The proportion of ham in the dataset is: {100*class_freq['ham']/len(emails):.2f}%")


def naive_bayes_classifier(text, word_freq=word_freq, class_freq=class_freq):
    text = text.lower()
    words = set(text.split())
    cumulative_product_spam = 1.0
    cumulative_product_ham = 1.0
    for word in words:
        if word in word_freq:
            cumulative_product_spam *= word_freq[word]['spam'] / class_freq['spam']
            cumulative_product_ham *= word_freq[word]['ham'] / class_freq['ham']
    likelihood_word_given_spam = cumulative_product_spam * (
                class_freq['spam'] / (class_freq['spam'] + class_freq['ham']))
    likelihood_word_given_ham = cumulative_product_ham * (class_freq['ham'] / (class_freq['spam'] + class_freq['ham']))
    prob_spam = likelihood_word_given_spam / (likelihood_word_given_spam + likelihood_word_given_ham)

    return prob_spam

msg = "enter the lottery to win three million dollars"
print(f"Probability of spam for email '{msg}': {100*naive_bayes_classifier(msg):.2f}%\n")

msg = "meet me at the lobby of the hotel at nine am"
print(f"Probability of spam for email '{msg}': {100*naive_bayes_classifier(msg):.2f}%\n")

msg = "9898 asjfkjfdj"
print(f"Probability of spam for email '{msg}': {100*naive_bayes_classifier(msg):.2f}%\n")