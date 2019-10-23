-- 
-- Haskell && Matemática
-- Exercícios resolvidos primeiro ano graduação
-- Autor: Dilson Gabriel Pieve
--

-----CONJUNTOS------------
  
list :: [Int] -> [Int]
list [] = []
list a = [y | y<-a, even y]

sb :: String -> String
sb x = reverse x

infixl 1 ##
(##) :: Bool -> Bool -> Bool
a ## b = (not a && b)||(not b && a)

dif_l :: [Int] -> [Int] -> [Int]
dif_l x y = quick(unic_l([a |a<-(x++y),xor (elem a y) (elem a x)]))
                where xor b c = (not c && b)||(not b && c)

intersec :: [Int] -> [Int] -> [Int]
intersec a b = unic_l ([y | y<-a, elem y b])

unic_l :: [Int] -> [Int]
unic_l [] = []
unic_l (cab:cor) | elem cab cor = unic_l cor
                 | otherwise = cab : unic_l cor


uniao :: [Int] -> [Int]-> [Int]
uniao a b = quick( unic_l (a++b) )

compl :: [Int] -> [Int] -> [Int]
compl a k = [y | y<-k, not(elem y a)]

-------------------------------------------------
--quick sort - ordenacao
quick :: [Int] -> [Int]
quick [] = []
quick (x:xs) = quick [y | y<- xs, y<x] ++ [x] ++ quick [y | y<- xs, y>=x]

--type Ponto = (Float, Float)
--distancia :: Ponto -> Ponto -> Float
--distancia (x1,y1) (x2,y2) = sqrt( (x2-x1)^2 + (y2-y1)^2)

---uso do where
type Ponto = (Float, Float)
distancia :: Ponto -> Ponto -> Float
distancia (x1,y1) (x2,y2) = sqrt( dif x1 x2 + dif y1 y2)
                            where dif a b = (a-b)^2
--global, local ---> uso do let in
f :: Double -> Double
f x = let a = x^2                --a=4
        in a^2 + 2*a + 1         --16+2*4+1=25


-------------------------------------------------------
--retorna :: Int -> [Int] -> Int
--retorna _ [] = 0
--retorna x y  = retornaAUX x y 0

--retornaAUX :: Int -> [Int] -> Int -> Int
--retornaAUX _ [] k = k
--retornaAUX x (a:b) k |  (x>a)    = retornaAUX x b (k+1) 
--                     | otherwise = retornaAUX x b k


--inverso :: [Int] -> [Int]
--inverso [] = []
--inverso (x:xs) = inverso xs ++ [x]

--repetir 4444 333 22 11

--repetir :: Int -> [Int]
--repetir 0 = []
--repetir x = inverso (repete x x ++ repetir (x-1))

--inverso :: [Int] -> [Int]
--inverso [] = []
--inverso (a:b) = inverso b ++ [a]

--repete :: Int -> Int -> [Int]
--repete x 0 = []
--repete x k | (k>0) = x:repete x (k-1) 



--l :: Int -> [Int]
--l 0 = []
--l x = l2 x : l (x-1)

--l2:: Int -> Int
--l2 1 = 1
--l2 2 = 3
--l2 x = l2 (x-1) + l2 (x-2)



--dif::[Int] -> [Int] -> [Int]
--dif [] y = y
--dif y [] = y
--dif (a:b) k | (aparece a k == False) = dif b (a:k)
--            | otherwise = dif b k

--aparece :: Int -> [Int] -> Bool
--aparece _ [] = True
--aparece elem (a:b) | (elem==a) = True
           --        | otherwise = aparece elem b 

--dif1 :: [Int] -> [Int] -> [Int]
--dif1 [] [] = []
--dif1 x [] = x
--dif1 [] y = y
--dif1 (a:b) (x:y) | (a==x) = dif1 b y
-- | (a<x) = a: dif1 b (x:y)
-- | (a>x) = dif1 (x:y) (a:b)


--pot :: Int -> Int -> Int
--pot _ 0  = 1
--pot 1 _  = 1
--pot x y = x*pot x (y-1)

--f :: [Int] -> Int -> [Int]
--f [] _ = []
--f (a:b) y = (pot a y):(f b y) 


--TIRA REPETIDOS
--unico :: [Int] -> [Int]
--unico [] = [] 
--unico (x:xs) | (elem x xs == True) = unico xs
--             | otherwise = x:unico xs

--ORGANIZAR
--quickSort :: [Int] -> [Int]
--quickSort [] = []
--quickSort (a:b) = quickSort [y|y<-b, y<a] ++ [a] ++ quickSort [y| y<-b, y>=a] 
   
--DIFERENCA SIMETRICA ENTRE DOIS CONJUNTOS
--difSimetrica :: [Int] -> [Int] -> [Int]
--difSimetrica x y  = quickSort ( unico ( [a|a<-(x++y), xor (elem a y) (elem a x)] ) )
--             where xor z w = (not z && w) || (not w && z)

--UNIAO 2 CONJUNTOS
--uniao :: [Int] -> [Int] -> [Int]
--uniao a [] = a
--uniao [] a = a
--uniao a b = quickSort ( unico ( [y| y<-(a++b)] ))

--INTERSECAO DOIS CONJUNTOS
--intersecao :: [Int] -> [Int] -> [Int]
--intersecao [] _ = []
--intersecao _ [] = []
--intersecao a b  = quickSort ( unico ( [y | y<-a, elem y b] ))

--POTENCIA DE UM CONJUNTO
--pot :: [Int] -> [[Int]]
--pot [] = [[]]
--pot (a:b) = pot b ++ [(a:z) | z<-pot b]




































