fun :: Float -> Float -> Float
fun a b | (a < b) = -1.0
		| (a == b)= 0
		| otherwise = a * b
