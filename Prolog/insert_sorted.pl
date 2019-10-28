% insert elem Y sorted list

insere([], Y, [Y]).
insere([X|C], Y, [Y,X|C]) :- Y < X.
insere([X|C], Y, [X|K]) :- insere(C, Y, K).