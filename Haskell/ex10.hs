-- Autor: Dilson Gabriel Pieve

-- Com cauda
-- fib(1, 2, 3, ...) = 1 1 2 3 5 8 13 21 34 55 

-- Definições
-- a  = fib (n - 2)
-- b  = fib (n - 1)

fib :: Int -> Int
fib n	= if n <= 2 then 1 else fibAux 1 1 (n - 2)
								where
									fibAux a b n 	| (n == 1)  = (a + b)						
												 	| otherwise = fibAux b (a + b) (n - 1)


