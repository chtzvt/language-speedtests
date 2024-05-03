#!/usr/bin/python

# Computes the largest prime factor of a number.

prime = int(600851475143)
i = 2

while (i <= prime): 

    if (prime % i == 0): 
        prime = prime/i
        i = i - 1
	
    i = i + 1

print(i)

