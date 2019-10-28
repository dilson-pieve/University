
-- ex20

inic :: [Int] -> Int -> [Int]
inic _ 0 = []
inic [] _ = []							-- bad input
inic (x:y) n = x : inic y (n - 1)

fim :: [Int] -> Int -> [Int]
fim x n = reverse (inic (reverse x) n)	-- incrível! :) 

-- fim ex20

-- Autor: Dilson Gabriel Pieve

