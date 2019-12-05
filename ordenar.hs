-- Ordenar uma lista

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar (elem:resto) =  (ordenar [x | x <- resto, x <= elem]) 
							++ [elem] ++  
									ordenar ([x | x <- resto, x > elem]) 

	