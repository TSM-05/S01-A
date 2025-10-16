class ArmaCorpoACorpo:
    def __init__(self, tipo):
        self.tipo = tipo

    def __str__(self):
        return f"Arma corpo a corpo: {self.tipo}"


class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} empunha {self.arma}"


class Joker:
    def __init__(self, equipe):
        self.arma = ArmaCorpoACorpo("Espada do Poder")
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker empunha {self.arma.tipo} e lidera os Phantom Thieves:")
        for membro in self.equipe:
            print(f" - {membro}")



Liu_Kang = PhantomThieves("Liu Kang", "Punhos flamejantes")
Raiden = PhantomThieves("Raiden", "Cajado místico")
Scorpion = PhantomThieves("Scorpion", "Correntes infernais")

equipe = [Liu_Kang, Raiden, Scorpion]

joker = Joker(equipe)

joker.mostrar_equipe()


