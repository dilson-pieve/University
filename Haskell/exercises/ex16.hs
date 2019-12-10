
-- ex16
-- elemento, lista, posicao -> resposta
inserePosicao :: Int -> [Int] -> Int -> [Int]
inserePosicao elem (h:t) pos  | (t == []) = [elem]									--insert end list
							  | (pos == 1) = [elem] ++ (h:t)
							  | otherwise = h : (inserePosicao elem t (pos - 1)) 

-- fim ex16

-- Autor: Dilson Gabriel Pieve

