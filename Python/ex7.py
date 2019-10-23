""" 5 / 3 = 2   5 - 3 """

def mod1 (a, b):
	while a >= b:
		a -= b
	return a

def mod2 (a, b):
	if a < b:
		return a
	return mod2 (a - b, b)

def divi1 (a, b):
	cnt = int (0)
	while a >= b:
		a -= b
		cnt = cnt + 1
	return cnt

def divi2 (a, b):
	if a < b:
		return 0
	return 1 + divi2 (a - b, b)

a = int (input ("a: "))
b = int (input ("b: "))

print (divi1 (a, b))
print (divi2 (a, b))

print (mod1 (a, b))
print (mod2 (a, b))

