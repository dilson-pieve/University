
-- ex14

nEsimo :: Int -> [Int] -> Int
nEsimo x y = nEsimoAux x 1 y
		where
			nEsimoAux _ _ [] = -1 								-- if wrong input
			nEsimoAux x p (h:t) = if x == p then h 
						else nEsimoAux x (p + 1) t

-- fim ex14

-- Autor: Dilson Gabriel Pieve

