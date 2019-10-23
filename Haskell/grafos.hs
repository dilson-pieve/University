-- Grafos Haskell
-- Autor: Dilson Gabriel Pieve, UNIFEI

type ListInt = [Int]
type Vertice = (Int, [Int])
type Grafo = [(Int, [Int])]

-- 1)Ordem do grafo
ordem::Grafo -> Int
ordem x = length(x)

-- 2) Tamanho do grafo
tamanho::Grafo->Int
tamanho g = (sum (degreeL g )) `div` (2)

-- 3) Grafo euleriano
euleriano::Grafo -> Bool
euleriano [ ] = True
euleriano g | all even (degreeL g) && length  [x | x <- vertices g, notElem x (buscaP g 1) ] == 0 = True
--(pseudo)  | (length [x | x <- degreeL g, odd x] == 2) = True
            | otherwise = False
-- Auxiliares
degree::Vertice -> Int
degree (a, b) = length(b)

degreeL::Grafo->[Int]
degreeL [] = []
degreeL (x:c) = degree(x):degreeL(c)

vertices::Grafo->ListInt
vertices [] = []
vertices ((a,b):c) = a:vertices c

-- 4) Complemento
complemento::Grafo->Grafo
complemento g = comp2 (vertices g) (vertices g) g 

comp2::ListInt-> ListInt-> Grafo -> Grafo
comp2 [] _ _ = [] 
comp2 (a:b) lista g = (a, [x | x <- lista, x /= a && notElem x (adj g a) ]):(comp2 b lista g)

-- 5) Multigrafo
multiaux::Vertice -> Bool
multiaux (a, []) = False
multiaux (a, (x:c)) = if elem x c then True else multiaux (a,c)

multigrafo:: Grafo -> Bool 
multigrafo [ ] = False
multigrafo (x:c) = if multiaux x then True else multigrafo c

-- 6)Busca Profundidade
buscaP::Grafo->Int->ListInt
buscaP g s = buscaPAux g [s] []

buscaPAux::Grafo->ListInt->ListInt->ListInt
buscaPAux _ [] v = v
buscaPAux g (c:e) v = buscaPAux (g) ([x | x <- adj g c, notElem x v]++e) (concatena c v)

-- Auxiliares
adj::Grafo->Int->ListInt
adj [] _ = []
adj ((a,b):c) x = if (x == a) then b else adj c x

concatena::Int->ListInt->ListInt
concatena c v = if notElem c v then (v++[c]) else v

-- 7) Busca Largura
buscaL::Grafo->Int->ListInt
buscaL g s = buscaLAux g [s] []

buscaLAux::Grafo->ListInt->ListInt->ListInt
buscaLAux _ [] v = v
buscaLAux g (c:e) v = buscaLAux (g) (e++[x | x <- adj g c, notElem x v]) (concatena c v)









































