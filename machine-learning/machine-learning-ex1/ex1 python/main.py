import numpy as np
import matplotlib.pyplot as plt

handle = open("../ex1/ex1data1.txt", 'r')

X = np.loadtxt("../ex1/ex1data1.txt", delimiter=',', usecols=0)
y = np.loadtxt("../ex1/ex1data1.txt", delimiter=',', usecols=1)

# m = 97
m = len(X)


#plt.plot(X, y, 'ro')
#plt.xlabel('Population of City in 10,000s')
#plt.ylabel('Profit in $10,000s')
#plt.show()

#Add a column of one
X = np.column_stack((np.ones(m), X))
theta = np.zeros(2, 1)
iterations = 1500
alpha = 0.01


def compute_cost(X, y, theta):

    J = 0
    m = len(X)

    return J
