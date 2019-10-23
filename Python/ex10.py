R = int (input ("Row: "))
C = int (input ("Col: "))

A = []

for i in range (R):
	a = []
	for j in range (C):
		a.append ( int (input()) )
	A.append (a)

B = []

for i in range (R):
	b = []
	for j in range (C):
		b.append ( int (input()) )
	B.append (a)

P = []
for i in range (R):
	k = []
	for j in range (C):
		k.append( A[i][j] + B[i][j] )
	P.append (k)


print (P)