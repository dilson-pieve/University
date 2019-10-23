
score = [float(score) for score in input ("Enter numbers: ").split ()]

score.sort ()
m = (sum (score) - score[len(score) - 1]) / (len(score)-1)
r = 'A' if m >= 9 else 'B' if (m >= 8) else 'C' if (m >= 7) else 'D' if (m >= 0) else 'X'
print("Average : ", m, ", Degree: ", r)


