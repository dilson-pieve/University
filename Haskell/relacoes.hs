-- 
-- Haskell && Matemática
-- Exercícios resolvidos primeiro ano graduação
-- Autor: Dilson Gabriel Pieve
--

--EXPONENCIACAO RAPIDA---------------------
expoente :: Int -> Int -> Int
expoente x n | (n==0)     = 1
             | (n%2 == 0) = expoente(x*x,n/2)
             | otherwise  = x*expoente(x*x,(n-1)/2) 

--RELACOES -> comp -----------
type ConjuntoInt = [Int]
type RelacaoInt = [(Int,Int)]

--Funções que testam se a relação é valida
valida :: ConjuntoInt -> RelacaoInt -> Bool
valida _ [] = True
valida c ((a,b):r) | ((elem a c) && (elem b c)) = valida c r
                   | otherwise = False

valida2 :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
valida2 _ _ [] = True
valida2 c1 c2 ((a,b):r) |(elem a c1 && elem b c2) = valida2 c1 c2 r
                        |otherwise = False

--1)
reflexiva :: ConjuntoInt -> RelacaoInt -> Bool
reflexiva c r |(valida c r) = and[elem (x,x) r | x <- c]
              |otherwise = False

--2)
irreflexiva :: ConjuntoInt -> RelacaoInt -> Bool
irreflexiva c r |(valida c r) = and not[elem (x,x) r | x <- c]
                |otherwise = False
--3)
simetrica :: ConjuntoInt -> RelacaoInt -> Bool
simetrica c r | (valida c r) = and[elem(b,a) | (a,b) <- r]
              | otherwise = False

--4)
antissimetrica :: ConjuntoInt -> RelacaoInt -> Bool
antissimetrica c r | (valida c r) = and not[elem(b,a) | (a,b) <- r, a /= b]
                   | otherwise = False

--5)
assimetrica :: ConjuntoInt -> RelacaoInt -> Bool
assimetrica c r | (valida c r) = and not[elem(b,a) | (a,b) <- r]
                | otherwise = False

--6)
transitiva :: ConjuntoInt -> RelacaoInt -> Bool
transitiva c r| (valida c r) = and[elem(a,c) r | (a,b) <- r, (x,c) <- r, b == x]
              | otherwise = False

--7)
ordemParcial :: ConjuntoInt -> RelacaoInt -> Bool
ordemParcial c r = (reflexiva c r) && (antissimetrica r) && (transitiva r r)

--8)
ordemParcialEstrita :: ConjuntoInt -> RelacaoInt -> Bool
ordemParcialEstrita c r = (irreflexiva c r) && (antissimetrica r) && (transitiva r r)

--9)
ordemTotal :: ConjuntoInt -> RelacaoInt -> Bool
ordemTotal c r | (ordemParcial c r) = and[elem(a,b) || elem (b,a) | a <- c, b <- c]
               | otherwise = False

--10) 
equivalencia :: ConjuntoInt -> RelacaoInt -> Bool
equivalencia c r = (reflexiva c r) && (simetrica r r) && (transitiva r r)

--11)
funcional :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
funcional a b r|(valida2 a b r) = funcional2 a b r
               |otherwise = False

funcional2 :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
funcional2 [] _ _ = True
funcional2 (a:b) c r |(funcional3 a r < 2) = funcional2 b c r
                     |otherwise = False

funcional3 :: Int -> RelacaoInt -> Int
funcional3 _ [] = 0
funcional3 x ((a,b):y)|(x == a) = 1 + funcional3 x y
                      |otherwise = funcional3 x y

--12)
injetora :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
injetora a b r|(valida2 a b r) = injetora2 a b r
              |otherwise = False

injetora2:: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
injetora2 _ [] _ = True
injetora2 c (a:b) r |(injetora3 a r < 2) = injetora2 b c r
                    |otherwise = False

injetora3 :: Int -> RelacaoInt -> Int
injetora3 _ [] = 0
injetora3 x ((a,b):y)|(x == b) = 1 + injetora3 x y
                     |otherwise = injetora3 x y

--13)
total :: ConjuntoInt -> ConjuntoInt-> RelacaoInt -> Bool
total c1 c2 r |(valida2 c1 c2 r) = total2 c1 c2 r
              |otherwise = False

total2 :: ConjuntoInt -> ConjuntoInt-> RelacaoInt -> Bool
total2 [] _ _ = True
total2 (a:b) c r |(total3 a r) = total2 b c r
                 |otherwise = False

total3 :: Int -> RelacaoInt -> Bool
total3 _ [] = False
total3 x ((a,b):y)|(x == a) = True
                  |otherwise = total3 x y

--14)
sobrejetora :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
sobrejetora a b r|(valida2 a b r) = sobrejetora2 a b r
                 |otherwise = False

sobrejetora2 :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
sobrejetora2 _ [] _ = True
sobrejetora2 c (a:b) r|(sobrejetora3 a r) = sobrejetora2 c b r
                      |otherwise = False

sobrejetora3 :: Int -> RelacaoInt -> Bool
sobrejetora3 _ [] = False
sobrejetora3 x ((a,b):y)|(x == b) = True
                        |otherwise = sobrejetora3 x y

--15)
isorrelacao :: ConjuntoInt -> ConjuntoInt -> RelacaoInt -> Bool
isorrelacao a b r = funcional a b r && total2 a b r && sobrejetora2 a b r && injetora2 a b r
-------------------------------------------------------------------------------------------
-----CONJUNTOS------------
  
--local,global
list :: [Int] -> [Int]
list [] = []
list a = [y|y<-a, even y]


sb :: String -> String
sb x = reverse x

infixl 1 ##
(##) :: Bool -> Bool -> Bool
a ## b = (not a && b)||(not b && a)

dif_l :: [Int] -> [Int] -> [Int]
dif_l x y = quick(unic_l([a|a<-(x++y),xor (elem a y) (elem a x)]))
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



-------------RELAÇÕES----------
-- REFLEXIVA
reflexiva :: [Int] -> [(Int,Int)] -> Bool
reflexiva [] _    = True
reflexiva (a:b) r = if not(elem(a,a) r) then False
                        else reflexiva b r

-- IRREFLEXIVA
irreflexiva :: [Int] -> [(Int,Int)] -> Bool
irreflexiva [] _    = True
irreflexiva (a:b) r = if elem(a,a) r then False
                        else irreflexiva b r

--SIMETRICA
simetrica :: [Int] -> [(Int,Int)] -> Bool
simetrica _ r = simetricaAUX r r

simetricaAUX :: [(Int,Int)] -> [(Int,Int)] -> Bool
simetricaAUX [] _ = True
simetricaAUX ((a,b):cauda) r = if not(elem (b,a) r) then False
                                else simetricaAUX cauda r      

--ANTISSIMÉTRICA
notSimetrica :: [Int] -> [(Int,Int)] -> Bool
notSimetrica _ r = notSimetricaAUX r r

notSimetricaAUX :: [(Int,Int)] -> [(Int,Int)] -> Bool
notSimetricaAUX [] _ = True
notSimetricaAUX ((a,b):cauda) r = if (elem (b,a) r) && (b /= a) then False
                                        else notSimetricaAUX cauda r      

--TRANSITIVA
busca :: Int -> [(Int,Int)] -> Int
busca _ [] = 0
busca x ((a,b):r) | x == a = b
                  | otherwise = busca x r

transitiva :: [Int] -> [(Int,Int)] -> Bool
transitiva _ r = transitivaAUX r r 

transitivaAUX ::  [(Int,Int)]-> [(Int,Int)] -> Bool
transitivaAUX [] _ = True
transitivaAUX ((a,b):r) r1 = if( not(elem (b,busca b r1) r1) && (not(elem(a,busca b r1) r1)) ) 
                                then False
                                        else transitivaAUX r r1


-- (1) Inserir N posicao (OK)
-- nEsimo :: Int -> [Int] -> Int
-- nEsimo _ []    = 0
-- nEsimo n lista = nEsimoAUX n lista 1

-- nEsimoAUX :: Int -> [Int] -> Int -> Int
-- nEsimoAUX n (x:xs) pos | (pos==n) = x
--                        | otherwise= nEsimoAUX n xs (pos+1)
-------------------------------------                       
-- (2) inserir primeira posicao de uma lista (OK)
--inserePrimeiro :: Int -> [Int] -> [Int]
--inserePrimeiro _ [] = []
--inserePrimeiro k (x:xs) | (k>(-9998)) = k:x: inserePrimeiro (-9999) xs
--                        | otherwise = x:inserePrimeiro (-9999) xs
-------------------------------------------------
-- (3) inserir ultima posicao de uma lista (OK)
--insereUltimo :: Int -> [Int] -> [Int]
--insereUltimo k []     = [k] 
--insereUltimo k (x:xs) = x:insereUltimo k xs
---------------------------------------
--4) Inserir um elemento na n-ésima posição de uma lista de inteiros.
--inserir :: Int -> Int -> [Int] -> [Int]
--inserir _ _ [] = []
--inserir elem pos lista = inserirAUX elem pos lista 1

--inserirAUX :: Int -> Int -> [Int] -> Int -> [Int]
--inserirAUX _ _ [] _ = []
--inserirAUX elem pos (x:xs) k | (pos==k) = elem:inserirAUX elem pos xs (k+1)
--                             | otherwise= x:inserirAUX elem pos xs (k+1)

---------------------------------------------
--(5)Retirar um determinado elemento de uma lista de caracteres.
--retiraCaracter :: Char -> [Char] -> [Char]
--retiraCaracter _  [] = []
--retiraCaracter procurado (x:cauda) | (x==procurado) = retiraCaracter procurado cauda  
--                                   | otherwise      = x:retiraCaracter procurado cauda
--------------------------------------------
-- (6) Substitua um determinado elemento (OK)
--trocaCaracter :: Char -> Char -> [Char] -> [Char]
--trocaCaracter  _ _ [] = []
--trocaCaracter procurado new (x:cauda) | (x==procurado) = new:trocaCaracter procurado new cauda  
--                                      | otherwise      = x:trocaCaracter procurado new cauda
--------------------------------------------------
--(7) Inverte lista (OK)
--(MODO 1) Modo EASY
--inverte :: [a] -> [a]
--inverte [] = [] 
--inverte (x:xs) = (inverte xs) ++ [x]
--(MODO 2)  Na mão :o
--inverte :: [Int] -> [Int]
--inverte xs = inverte_2 xs []

--inverte_2 :: [Int] -> [Int] -> [Int]
--inverte_2 [] y = y
--inverte_2 (x:xs) y =  inverte_2 xs (x:y) 
-----------------------------------------------------
--8) Construir uma lista com os n primeiros números da série de Fibonacci. (OK)
--quant :: Integer -> [Integer]
--quant x = insere x 0 1

--insere :: Integer -> Integer -> Integer -> [Integer]
--insere x k w | (k<x) = insereAUX x k w
--             |otherwise = []
 
--insereAUX :: Integer -> Integer -> Integer -> [Integer]
--insereAUX x k w =  (fib w):insere x (k+1) (w+1)

--fib :: Integer -> Integer
--fib 0 = 0
--fib 1 = 1
--fib x = fib(x-1) + fib(x-2)
------------------------------------------------
--9) Verificar se um String (lista de caracteres) é um palíndromo.
--palindromo :: String -> Bool
--palindromo [] = True
--palindromo k | (k==inverte k) = True
--             | otherwise = False

--inverte :: String -> String
--inverte [] = []
--inverte (x:xs) = inverte (xs) ++ [x]

-----------------------------------------
--13) Calcular a média de uma lista de números reais (float).
--media :: [Float] -> Float
--media y = (somatorio y)/ (qt y 0)

--somatorio :: [Float] -> Float
--somatorio []     = 0
--somatorio (x:xs) = x + somatorio xs

--qt :: [Float] -> Float -> Float
--qt [] k = k
--qt (x:xs) k = qt xs (k+1)
---------------------------------------
--14) Calcular a mediana de uma lista de números reais (float).

ordena :: [Int] -> [Int]
ordena [] = []
ordena (x:xs) = insere x (ordena xs)

insere :: Int -> [Int] -> [Int]
insere elem [] = [elem]
insere elem (x:y) | (elem<=x) = elem:x:y
                  | otherwise = x:insere elem y

comp :: [Int] -> Int
comp [] = 0
comp (x:xs) = 1 + comp xs

mediana :: [Int] -> Int
mediana y = medianaAUX (ordena y) ((comp y)/2)

par :: Int -> Bool
par k | k `mod` 2 == 0 = True
      | otherwise = False

medianaAUX :: [Int] -> Int -> Int
medianaAUX y k | (par k == True) = mediador y (k+1) 1  + mediador y (k-1) 1
               | otherwise   = mediador y (k/2+1) 1

mediador :: [Int] -> Int -> Int -> Int
mediador (x:xs) k pos | (pos>k) = x
                      | otherwise = mediador xs k (pos+1) 
-------------------------------------------------------------------
-- (A) somatorio de uma lista
--somatorio :: [Int] -> Int
--somatorio [] = 0
--somatorio (x:xs) = x + somatorio xs

-- (B) encontrar posicao elemento
--find :: [Int] -> Int -> Int
--find (x:xs) k = foundAUX (x:xs) k 1

--foundAUX :: [Int] -> Int -> Int -> Int
--foundAUX (x:xs) k q | (x==k)    = q
--                    | otherwise = foundAUX xs k (q+1)


-- (C) inserir primeira posicao de uma lista
--insere :: [Int] -> Int -> [Int]
--insere [] _     = []
--insere (x:xs) k | (k>0) = k:x: insere(xs) 0
--                | otherwise = x:insere xs 0

-- (D) inserir ultima posicao de uma lista
--insere :: [Int] -> Int -> [Int]
--insere [] k     = [k] 
--insere (x:xs) k = x:insere xs k

-- (E) insere n-ésima posição
--insere :: [Int] -> Int -> Int -> [Int]
--insere (x:xs) n elem = procura (x:xs) n elem 1

--procura :: [Int] -> Int -> Int -> [Int]
--procura (x:xs) n elem q | (n==q)    = x:insereN xs elem
--                        | otherwise = x:procura xs n elem q+1

--insereN :: [Int] -> Int -> [Int]
--insereN [] _        = []
--insereN (x:xs) elem | (k>0) = k:x: insereN(xs) 0
--                    | otherwise = x:insereN xs 0

-- (F) Insere elemento lista ordenada
--lista :: [Int] -> Int -> [Int]
--lista (x:xs) k = insere k (ordena (x:xs))
 
--ordena :: [Int] -> [Int]
--ordena [] = []
--ordena (x:xs) = insere x (ordena xs)

--insere :: Int -> [Int] -> [Int]
--insere elem [] = [elem]
--insere elem (x:xs) | (elem<=x) = elem:x:xs
--                   | otherwise = x:insere elem xs

-- (G) Retire um elemento da lista
--remove :: [Int] -> Int -> [Int]
--remove [] _                 = []
--remove (x:xs) k | (k==x)    = remove xs k

-- (H) Substitua um determinado elemento
--sub :: [Int] -> Int -> Int -> [Int]
--sub [] _ _ = []
--sub (x:xs) k y | (x==k) = y:sub xs k y  --K=elemento que vai trocar Y=por qual vou trocar
--               | otherwise = x:sub xs k y
--(I) Inverte lista
--(MODO 1)
--inverte :: [a] -> [a]
--inverte [] = [] 
--inverte (x:xs) = (inverte xs) ++ [x]
--(MODO 2)  -> Usando para concatenar '-'
inverte :: [Int] -> [Int]
inverte xs = inverte_2 xs []

inverte_2 :: [Int] -> [Int] -> [Int]
inverte_2 [] y = y
inverte_2 (x:xs) y =  inverte_2 xs (x:y) 

--CALCULE N TERMO FIB -> adaptação para mostrar os n primeiros termos
--quant :: Integer -> [Integer]
--quant x = insere x 0 1

--insere :: Integer -> Integer -> Integer -> [Integer]
--insere x k w | (k<x) = insereAUX x k w
--             |otherwise = []
 
--insereAUX :: Integer -> Integer -> Integer -> [Integer]
--insereAUX x k w =  (fib w):insere x (k+1) (w+1)

--fib :: Integer -> Integer
--fib 0 = 0
--fib 1 = 1
fib x = fib(x-1) + fib(x-2)


 



































