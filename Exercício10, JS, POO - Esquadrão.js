class ODM_Gear {
    #gasRestante;
     modelo;

    constructor(modelo, gasInicial = 100) {
        this.modelo = modelo;
        this.#gasRestante = gasInicial;
    }

    usarGas(quantidade) {
        if (this.#gasRestante >= quantidade) {
            this.#gasRestante -= quantidade;
            console.log(`Usando ${quantidade} de gás. Restante: ${this.#gasRestante}`);
            return true;
        } else {
            console.log("Gás insuficiente!");
            return false;
        }
    }

    getGas() {
        return this.#gasRestante;
    }
}

class Soldado {
    #gear; 
    name;

    constructor(nome, modeloGear) {
        this.name = nome;
        this.#gear = new ODM_Gear(modeloGear); 
    }

    explorarTerritorio() {
        const sucesso = this.#gear.usarGas(40); 
        if (sucesso) {
            return `${this.name} está explorando o território...`;
        } else {
            return `${this.name} não pode explorar, gás insuficiente!`;
        }
    }

    verificarEquipamento() {
        const gas = this.#gear.getGas(); 
        const modelo = this.#gear.modelo;
        return `${this.name} verificou seu equipamento: ${modelo} (Gás: ${gas}%)`;
    }
}


class Esquadrao {
    #lider;
    #membros;

    constructor(lider, membrosIniciais = []) {
        this.#lider = lider;
        this.#membros = [lider, ...membrosIniciais];
    }

    adicionarMembro(soldado) {
        this.#membros.push(soldado);
        console.log(`LOG: ${soldado.name} foi adicionado ao esquadrão.`);
    }

   
    explorarTerritorioEmGrupo() {
        console.log(`\n--- Esquadrão sob o comando de ${this.#lider.name} iniciando exploração! ---`);
        const relatorios = [];
        for (const soldado of this.#membros) {
            relatorios.push(soldado.explorarTerritorio());
        }
        return relatorios.join("\n");
    }

    relatarStatus() {
        const status = [];
        for (const soldado of this.#membros) {
            status.push(soldado.verificarEquipamento());
        }
        return status.join("\n");
    }
}


const Snake = new Soldado("Solid Snake", "Modelo Padrão Avançado");
const Ocelot = new Soldado("Ocelot", "Modelo Padrão");
const Otacon = new Soldado("Otacon", "Modelo Leve");

const esquadraoLevi = new Esquadrao(Snake, [Ocelot, Otacon]);

console.log("\n--- Verificação de Equipamento ---");
console.log(esquadraoLevi.relatarStatus());

console.log(esquadraoLevi.explorarTerritorioEmGrupo());

console.log("\n--- Verificando Status dos Equipamentos ---");
console.log(esquadraoLevi.relatarStatus());
