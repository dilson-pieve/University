
-- cool

isPrime :: Int -> Bool
isPrime k = length ( [x | x <- [1 .. k], (mod k x) == 0] ) == 2