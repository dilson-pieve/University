-- Autor: Dilson Gabriel Pieve
-- v, vo e t

deltaDist :: Float -> Float -> Float -> Float
deltaDist v vo t = vo * t + (a * t * t) / 2
			where
				a = (v - vo) / 2 

