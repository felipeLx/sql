from pickle import TRUE
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import f1_score
from sklearn.linear_model import LogisticRegression

data = pd.read_csv('./covid_data.csv')
# print(data.head())
countries = ['Italy', 'Portugal', 'Germany', 'Finland']
data = data[data['location'].isin(countries)]
print(data.head())
train, test = train_test_split(data, test_size = 0.3, stratify=data.iloc[:,4:8])

my_log_reg = LogisticRegression()
my_log_reg.fit(train[['population', 'aged_65_older_percent']], train['new_deaths'])

preds = my_log_reg.predict(test[['population', 'aged_65_older_percent']])

f1 = f1_score(test['new_deaths'], preds, average='micro')
print('f1: ', f1)