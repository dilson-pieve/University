tempoGasto :: Float -> Float -> Float
tempoGasto d v = d / v

difTempo :: Float -> Float -> Float -> Float -> Float
difTempo d1 v1 d2 v2 = abs ((tempoGasto d1 v1) - (tempoGasto d2 v2))



