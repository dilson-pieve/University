-- ex18

--maneira rápida 
inverteListaR :: [Int] -> [Int]
inverteListaR x = reverse x


--na "mão"
inverteLista :: [Int] -> [Int]
inverteLista [] = []
inverteLista (h:t)  = inverteLista t ++ [h]

-- fim ex18

-- Autor: Dilson Gabriel Pieve

