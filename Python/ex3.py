med = float (input("Medida: "))
met = input ("Metrica (L, P, M): ")

r = 4.9 * med if met == 'L' else med / 3.28 if met == 'P' else med * 4.83 / 3.0
print("Resp: ", r) 
