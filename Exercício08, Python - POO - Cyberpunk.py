from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, nome, implante):
        self.nome = nome
        self.implante = implante

    def realizar_hack(self):
        print(f"{self.nome} está hackeando usando {self.implante.funcao} (Custo: {self.implante.custo})")

class Faccao:
    def __init__(self, nome):
        self.nome = nome
        self.membros = []

    def adicionar_membro(self, membro):
        self.membros.append(membro)

    def executar_hacks(self):
        print(f"\nFacção {self.nome} iniciando operação de hack coletivo...")
        for membro in self.membros:
            membro.realizar_hack()

implante1 = Implante(5000, "Kiroshi")
implante2 = Implante(7500, "Cyberdeck")
implante3 = Implante(10000, "Sandevistan")

n1 = NetRunner("V", implante1)
n2 = NetRunner("Lucy", implante2)
n3 = NetRunner("David", implante3)

faccao = Faccao("Edgerunners")
faccao.adicionar_membro(n1)
faccao.adicionar_membro(n2)
faccao.adicionar_membro(n3)

faccao.executar_hacks()
