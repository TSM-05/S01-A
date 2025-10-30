class Pokemon {
  #vida;
  
  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }
  
  getVida() {
    return this.#vida;
  }
  
  receberDano(dano) {
    this.#vida = Math.max(0, this.#vida - dano);
    console.log(`${this.nome} recebeu ${dano} de dano! Vida restante: ${this.#vida}`);
  }
  
  atacar(alvo) {
    console.log(`${this.nome} usa Ataque Genérico!`);
    alvo.receberDano(20);
  }
}


class Pokemon_Fogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }
  
  atacar(alvo) {
    const dano = 30 + this.bonusAtaque;
    console.log(`${this.nome} usa Rajada de Fogo!`);
    alvo.receberDano(dano);
  }
}


class Pokemon_Agua extends Pokemon {
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.curaBase = curaBase;
  }
  
  atacar(alvo) {
    console.log(`${this.nome} usa Jato d'Água!`);
    alvo.receberDano(25);
    
    
    const cura = this.curaBase;
    const vidaAtual = this.getVida();
    this.receberDano(-cura); 
    console.log(`${this.nome} se curou em ${cura} pontos!`);
  }
}

console.log("=== INÍCIO DA BATALHA ===\n");

const charizard = new Pokemon_Fogo("Charizard", 100, 15);
const blastoise = new Pokemon_Agua("Blastoise", 100, 10);

console.log(`${charizard.nome} (Vida: ${charizard.getVida()}) VS ${blastoise.nome} (Vida: ${blastoise.getVida()})\n`);


console.log("Rodada 1:");
charizard.atacar(blastoise);
console.log();

console.log("Rodada 2:");
blastoise.atacar(charizard);
console.log();

console.log("Rodada 3:");
charizard.atacar(blastoise);
console.log();

console.log("=== STATUS FINAL ===");
console.log(`${charizard.nome}: ${charizard.getVida()} HP`);
console.log(`${blastoise.nome}: ${blastoise.getVida()} HP`);
