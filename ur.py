import numpy as np

A=np.array([[1,2],[5,6]])
B=np.array([3,4])

# A=np.random.randn(10,10)
# B=np.array(range(1,11))

print(A)
print(B)

w=np.linalg.det(A)
print('wyznacznik = ',w)

x=np.linalg.solve(A,B)
print(x)

print(np.dot(A,x))

