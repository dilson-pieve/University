R = int (input ("Row: "))
C = int (input ("Col: "))

s = int (0)

for i in range (R):
	for j in range (C):
		s = s + int (input())

print (s / (R * C))
