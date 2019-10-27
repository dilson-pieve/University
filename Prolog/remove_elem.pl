remo([], _, []).
remo([X|C], Y, [X|K]) :- X \= Y, !, remo(C, Y, K).
remo([X|C], Y, K) :- remo(C, Y, K).