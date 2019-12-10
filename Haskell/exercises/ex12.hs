

-- ex12

--Soma 2 inteiros (comum)
somaNat1 :: Int -> Int -> Int
somaNat1 x y | (x < y)  = somaNatAux1 x y
			| otherwise = somaNatAux1 y x

--Soma 2 inteiros (menor -> maior)
somaNatAux1 :: Int -> Int -> Int
somaNatAux1 0 y = y
somaNatAux1 x y = 1 + somaNatAux1 (x-1) y

--Soma 2 inteiros (cauda)

somaNat :: Int -> Int -> Int
somaNat x y | (x < y)   = somaNatAux x y
			| otherwise = somaNatAux y x

--Soma 2 inteiros (menor -> maior)
somaNatAux :: Int -> Int -> Int
somaNatAux 0 y = y
somaNatAux x y = somaNatAux (x-1) (y+1)

-- Autor: Dilson Gabriel Pieve

