# -*- coding = utf-8 -*-
"""
Created on Sun Nov 05 07 =52 =30 2017

@author = zhaoy
"""
import numpy as np
import matplotlib.pyplot as plt

#base = 1000
#gamma = 2.0/base
#power = 1
#lambda_min = 0
#iteration = 0
#n_iter = 28000

#sphereface
base = 1000
gamma = 0.012
power = 1
lambda_min = 5
iteration = 0
n_iter = 28000

##Large-margin
#base = 1000
#gamma = 0.000025
#power = 35
#iteration = 0
#lambda_min = 5
#n_iter = 28000

iters = np.arange(0, n_iter, 100) + iteration
lambdas = np.zeros( iters.shape)
for i in range(len( iters)):
    lambdas[i] = base * ( 1 + gamma * iters[i]) ** (-power)

print lambdas.max()
print lambdas.min()

lambdas_clip = np.maximum(lambdas, lambda_min)

print lambdas_clip.max()
print lambdas_clip.min()

plt.plot(iters, lambdas, hold=True)
plt.plot(iters, lambdas_clip, hold=True)
#plt.plot(iters, lambdas_clip-lambdas, hold=True)


#x=np.linspace(0,np.pi*2,1000)
#
#plt.plot(x,np.sin(x),hold=True)
#plt.plot(x,np.sin(x)**2,hold=True)
plt.show()