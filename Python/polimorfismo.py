# Exemplo de polimorfismo usando python
# Autor ~ Dilson

class Ponto:
	def __init__(self, x, y):
		self.x = x
		self.y = y

	def print_info (self):
		print ("Centro = (", self.x, ",", self.y, ")")


class Circ(Ponto):                                         #herança
	def __init__(self, x, y, r):
		Ponto.__init__(self, x, y)
		self.raio = r

	def print_info (self):
		Ponto.print_info (self)							   #herança						
		print ("Raio = ", self.raio)


print ("Ponto:")
p1 = Ponto(2, 1)
p1.print_info()


print ("\nCirculo:")
c1 = Circ (5, 4, 3)
c1.print_info()

print ("\n#Lista:\n")

lista_diferentes = [p1, c1]

print ("Primero:")
lista_diferentes[0].print_info ()                         # Polimorfismo - cada um responde de acordo com sua própria especificação #
																#é possível chamar o método correto!
print ("\nSegundo:")												# repare que o para o primeiro imprime somente o ponto
lista_diferentes[1].print_info ()									# para o segundo imprime o ponto + raio		
														


