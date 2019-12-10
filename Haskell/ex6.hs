fun :: Int -> Int
fun n | (n == 0) = 1
	  | (n == 1 || n == 2) = 3
	  | otherwise = fun (n - 1) + fun (n - 2) 
