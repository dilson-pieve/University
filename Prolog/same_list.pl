check([], [], _) .
check([X|C1], [Y|C2], R) :- (X == Y), check(C1,C2,R1).