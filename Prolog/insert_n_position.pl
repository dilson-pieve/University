insere(C, Y, 1, [Y | C] ).
insere([X|C], Y, N, [X|K]) :- N1 is N - 1, insere(C, Y, N1, K).