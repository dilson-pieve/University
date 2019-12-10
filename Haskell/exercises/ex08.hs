--void soma (int N, int *R) {
--	int i;
--	*R = 0;
--	for (int i = 1; i < N; i++) {
--		if (i % 2 == 1)
--			*R += i;
--	}
--}


semelhante :: Int -> Int -> Int
semelhante 0 x = x
semelhante n x	| (mod n 2) == 1 = semelhante (n - 1) (x + n)
				| otherwise = semelhante (n - 1) x



