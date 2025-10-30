class Criatura {
    constructor(nome, perigosa) {
        this.nome = nome;
        this.perigosa = perigosa;
    }
}

class Personagem {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }
}

class Protagonista extends Personagem {
    #diario;

    constructor(nome, idade) {
        super(nome, idade);
    }

    setDiario(diario) {
        this.#diario = diario;
    }

    lerDiario(chave, num) {
        if (this.#diario) {
            console.log(`\n${this.nome} tenta decodificar o enigma ${num}:`);
            console.log(this.#diario.decodificar(chave, num));
        } else {
            console.log(`${this.nome} não encontrou o diário!`);
        }
    }
}

class Diario {
    #autorSecreto;
    #enigmas;
    #criaturasAvistadas;

    constructor(autor) {
        this.#autorSecreto = autor;
        
        this.#enigmas = new Map();
        
        this.#criaturasAvistadas = []; 
    }

    getAutor() {
        return this.#autorSecreto;
    }

    adicionarEnigma(num, enigma) {
        this.#enigmas.set(num, enigma);
        console.log(`Enigma ${num} adicionado ao diário.`);
    }

    adicionarCriatura(criatura) {
        this.#criaturasAvistadas.push(criatura);
    }

    
    decodificar(chave, num) {
        if (chave !== this.#autorSecreto) {
            return "CHAVE DE ACESSO INCORRETA. Acesso negado.";
        }

        if (!this.#enigmas.has(num)) {
            return `Enigma número ${num} não encontrado.`;
        }

        return this.#enigmas.get(num);
    }
}


class CabanaMisterio {
    visitantes;
    #funcionarios; 
    #diario;

    constructor(diario) {
        this.#diario = diario; 
        this.visitantes = [];
        
        this.#funcionarios = [];
    }

    contratarFuncionario(personagem) {
        if (personagem instanceof Personagem) {
            this.#funcionarios.push(personagem);
            console.log(`${personagem.nome} agora é funcionário da Cabana do Mistério.`);
        }
    }
    
    listarFuncionarios() {
        return this.#funcionarios;
    }
}

//Main

console.log("--- Bem-vindo a Gravity Falls ---");

const dipper = new Protagonista("Dipper", 12);
const mabel = new Protagonista("Mabel", 12);
const soos = new Personagem("Soos", 22);
const wendy = new Personagem("Wendy", 15);
const stan = new Personagem("Tivô Stan", 60);


const AUTOR_SECRETO = "Ford Pines";
const diario3 = new Diario(AUTOR_SECRETO);
dipper.setDiario(diario3); 

const cabanaDoMisterio = new CabanaMisterio(diario3);


cabanaDoMisterio.contratarFuncionario(soos);
cabanaDoMisterio.contratarFuncionario(wendy);
cabanaDoMisterio.contratarFuncionario(stan); 


console.log("\n--- Testando o Diário ---");
diario3.adicionarEnigma(1, "O fim está próximo");
diario3.adicionarEnigma(21, "Cipher está te observando");
diario3.adicionarEnigma(44, "O trinângulo é a chave");


dipper.lerDiario("Ford Pines", 21);

