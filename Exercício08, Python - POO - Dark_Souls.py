class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida
        self._resistencia = resistencia

    # Getter para 'vida'
    @property
    def vida(self):
        return self._vida

    # Setter controlado para 'vida'
    @vida.setter
    def vida(self, valor):
        if valor < 0:
            self._vida = 0
        else:
            self._vida = valor

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada  # atributo exclusivo

    def __str__(self):
        tipo_armadura = "com armadura pesada" if self.armadura_pesada else "sem armadura pesada"
        return f"Cavaleiro {tipo_armadura}, com {self._vida} de vida e {self._resistencia} de resistência"



p1 = Personagem(100, 50)
cav = Cavaleiro(150, 70, True)

print(p1)
print(cav)


cav.vida = 120
print("Após dano extremo:", cav)
