from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativou seu escudo!")


class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Dano) lançou uma chuva de balas!")


herois = [
    Tanque("Reinhardt", "Tanque"),
    Dano("Soldado 76", "Dano"),
    Tanque("Roadhog", "Tanque"),
    Dano("Cassidy", "Dano")
]

for heroi in herois:
    heroi.usar_ultimate()
