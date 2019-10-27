fibo(0, 1).
fibo(1, 1).
fibo(X, Y) :- X > 1,
				X1 is X -1,
					X2 is X - 2,
						fibo(X1, Y1),
							fibo(X2, Y2),
								Y is Y1 + Y2.
								