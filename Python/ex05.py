import math
import cmath

def delta (a, b, c):
	return b * b - 4 * a * c


a = float (input ("a: "))
b = float (input ("b: "))
c = float (input ("c: "))
d = delta (a, b, c)

if d == 0:
	x1 = ( (-1) * b + math.sqrt (d) / (2 * a))
	print (x1)

elif d > 0:
	x1 = ( (-1) * b + math.sqrt (d) ) / (2 * a)
	x2 = ( (-1) * b - math.sqrt (d) )/  (2 * a)
    
	print (x1)
	print (x2)

else:

	x1 = complex ((-1) * b / (2 * a),  math.sqrt ((-1) * d) / (2 * a))
	x2 = complex ((-1) * b / (2 * a), -math.sqrt ((-1) * d) / (2 * a))

	print (x1)
	print (x2)


