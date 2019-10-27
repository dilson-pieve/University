insere([], Y, [Y]).
insere([X|C], Y, [X|K]) :- insere(C, Y, K).