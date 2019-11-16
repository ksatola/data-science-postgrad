import numpy as np

# uklad 2 rownan i 2 niewiadomych
A=np.array([[1,2],[5,6]])
B=np.array([3,4])

# 10 rownan i 10 niewiadomych
A=np.random.randn(10,10)
B=np.array(range(1,11))

# 100 rownan i 100 niewiadomych
A=np.random.randn(100,100)
B=np.array(range(1,101))

print(A)
print(B)

w=np.linalg.det(A)
print('wyznacznik = ',w)

x=np.linalg.solve(A,B)
print(x)

print(np.dot(A,x))

