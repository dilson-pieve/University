-- ex19

media :: [Float] -> Float
media [] = 0
media x  = (sum x) / (len (x))
			where 
				len [] = 0
				len (h:t) = 1 + len t

-- fim ex19

-- Autor: Dilson Gabriel Pieve

