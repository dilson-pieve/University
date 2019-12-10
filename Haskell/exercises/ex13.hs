
-- ex13

fibo :: Int -> Int
fibo n = fiboAux n
	where	
		fiboAux 0 = 1
		fiboAux 1 = 1
		fiboAux n = fiboAux (n - 1) + fiboAux (n - 2)

-- fim ex13

-- Autor: Dilson Gabriel Pieve

