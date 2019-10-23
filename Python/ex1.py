n1 = int (input ("N1: "));
n2 = int (input ("N2: "));
n3 = int (input ("N3: "));

m = float (n1 + n2 + n3) / 3.0;

if (m >= 7.0):
	print("Ok ->", m);
else:
	n4 = int (input ("Sub: "));
	m = (m + n4) / 2.0;
	if (m >= 5):
		print("Ok -> ", m);
	else:
		print ("!Ok -> ", m);



