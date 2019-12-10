-- ex17

--entrada: tenho, quero que seja, str atual, str resposta
trocaChar :: Char -> Char -> [Char] -> [Char]
trocaChar _ _ [] = []
trocaChar x y (h:s) | (x == h) = y : (trocaChar x y s)
					| otherwise = h : (trocaChar x y s)

-- fim ex17

-- Autor: Dilson Gabriel Pieve

