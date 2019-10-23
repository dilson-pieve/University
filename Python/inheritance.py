# Exemplo de heranca usando python
# Autor ~ Dilson

class Pessoa:
	def __init__(self, nome = "", idade = 0):
		self.nome = nome
		self.idade = idade

		print("Passou em Pessoa!")

	def print_nome (self):
		print ("Nome eh", self.nome)

	def print_idade (self):
		print("Idade eh", self.idade)


class Hobby:
	def __init__(self, atividade = ""):
		self.atividade = atividade

	def print_atividade (self):
		print ("Passatempo eh", self.atividade)


class Aluno (Pessoa, Hobby):                                                   # múltipla herança
	def __init__ (self, nome = "", idade = 0, curso = "", atividade = ""):     # já com valor inicial
		# super().__init__(nome, idade)                                     
		Pessoa.__init__(self, nome, idade)
		Hobby.__init__(self, atividade)
		
		self.curso = curso

		print("Passou em Aluno!\n")

	def print_curso (self):
		print ("Curso eh", self.curso)
	


print ("#Criar aluno exemplo:\n")
aluno = Aluno ("Joao", 67, "Medicina", "Ler")

aluno.print_nome ()
aluno.print_idade()
aluno.print_curso()
aluno.print_atividade()


print("\n#Criar pessoa exemplo:\n")
pessoa = Pessoa("Rodger", 92)

pessoa.print_nome()
pessoa.print_idade()


