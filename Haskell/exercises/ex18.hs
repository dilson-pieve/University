
-- ex18

--maneira rápida de escrever
inverteListaR :: [Int] -> [Int]
inverteListaR x = reverse x


--maneira lenta
inverteLista :: [Int] -> [Int]
inverteLista [] = []
inverteLista (h:t)  = inverteLista t ++ [h]

-- fim ex18

-- Autor: Dilson Gabriel Pieve

