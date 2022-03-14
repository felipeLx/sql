import numpy as np
import pandas as pd
import scipy.optimize as sc
import matplotlib.pyplot as plt

data = pd.read_csv('./data_expfunction.csv')
print(data)

def func(x, a, b, c):
    return a * np.log(b * x) + c

y = np.array(data.iloc[:,2])
x = np.array(data.iloc[:,1])
xn = x + 0.2*np.random.normal(size=len(y))

popt, pcov = sc.curve_fit(func, y, xn)

print('popt', popt)
print('pcov', pcov)

plt.figure()
plt.plot(y, xn, 'ko', label='Original data')
plt.plot(y, func(y, *popt), 'r-', label="Fitted Curve")
plt.legend()
plt.show()

res = sc.curve_fit(lambda t, a, b: a*np.exp(b*t), x, y, p0=(5322,0))
# print(res)
