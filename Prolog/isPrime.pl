divisors(X,1,1) :- !.
divisors(X,K,Y) :- (K > 0), K1 is K - 1, 
						divisors(X, K1, Y1), 
						(mod(X,K) < 1 -> Y is 1 + Y1; Y is Y1).

isPrime(X,Y) :- divisors(X, X, K), (K == 2 -> true; false).