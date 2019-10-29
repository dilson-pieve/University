fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib x = fibs (x-2) 1 1
		where 
			fibs 1 a b = a + b
			fibs p a b = fibs (p - 1) (a + b) (a)	
