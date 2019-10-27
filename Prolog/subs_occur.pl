subs([], _, _, []).
subs([X|C], A, B, [X|K]) :- A \= X, !, subs(C, A, B, K).
subs([X|C], A, B, [B|K]) :- subs(C, A, B, K).