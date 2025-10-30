class Hunter {
    #localizacao;
    
    name;
    idade;

    constructor(nome, local, idade) {
        this.name = nome;
        this.idade = idade;
        this.#localizacao = local;
    }

    rastrearLocal(latitude, longitude) {
        const novaLocalizacao = `Latitude: ${latitude}, Longitude: ${longitude}`;
        this.#localizacao = novaLocalizacao;
        return `${this.name} (${this.constructor.name}) rastreou a área até: ${this.#localizacao}`;
    }

    getLocalizacao() {
        return this.#localizacao;
    }
}

class Especialista extends Hunter {
    #habilidadeNen;
    
    constructor(nome, local, idade, habilidade) {
        super(nome, local, idade);
        this.#habilidadeNen = habilidade;
    }

    rastrearLocal(latitude, longitude) {
        const localEncontrado = `Base Secreta na lua - Coordenadas: ${latitude}, ${longitude}`;
        const info = `Usando ${this.#habilidadeNen}, ${this.name} localizou: ${localEncontrado}`;
        
        super.rastrearLocal(latitude, longitude); 
        return info;
    }
}

class Manipulador extends Hunter {
    #alvoAtual;
    
    constructor(nome, local, idade, alvo) {
        super(nome, local, idade);
        this.#alvoAtual = alvo;
    }

    rastrearLocal(latitude, longitude) {
        const localizacaoAlvo = `Base lunar (${this.#alvoAtual}) - Coordenadas: ${latitude}, ${longitude}`;
        const info = `${this.name} (Manipulador) focou o rastreio no alvo ${this.#alvoAtual}: ${localizacaoAlvo}`;
        super.rastrearLocal(latitude, longitude);
        return info;
    }
}

class Batalhao {
    #hunters; 

    constructor() {
        this.#hunters = new Set(); 
    }

    adicionarHunter(hunter) {
        for (const h of this.#hunters) {
            if (h.name === hunter.name) {
                console.warn(`AVISO: Hunter '${hunter.name}' já está no Batalhão!`);
                return;
            }
        }
        
        this.#hunters.add(hunter);
        console.log(`Hunter '${hunter.name}' adicionado com sucesso.`);
    }

    getNumbHunters() {
        return this.#hunters.size;
    }

    iniciarRastreamento(lat, long) {
        console.log(`\n--- INICIANDO RASTREAMENTO na Latitude: ${lat}, Longitude: ${long} ---`);
        const relatorios = [];
        
        for (const hunter of this.#hunters) {
            const relatorio = hunter.rastrearLocal(lat, long); 
            relatorios.push(relatorio);
        }

        return relatorios;
    }
}

// Utilização de personagnes do universo Invencivel

const invencivel = new Especialista("Mark Grayson", "Marte", 20, "Aprimoramento (Super-audição)");
const omni_man = new Especialista("Nolan Grayson", "Viltrum", 340, "Aprimoramento (Super-força)");
const cecil = new Manipulador("Cecil Stedman", "Pentágono", 62, "Viltrumitas");
const eve = new Hunter("Eve Atômica", "QG dos guardiões");

const batalhao = new Batalhao();

batalhao.adicionarHunter(invencivel);
batalhao.adicionarHunter(omni_man);
batalhao.adicionarHunter(cecil);
batalhao.adicionarHunter(eve);


console.log(`\nTotal de Hunters no Batalhão: ${batalhao.getNumbHunters()}`);

const LAT = 34.05;
const LONG = -118.25;

const resultadosRastreamento = batalhao.iniciarRastreamento(LAT, LONG);

resultadosRastreamento.forEach((resultado, index) => {
    console.log(`[Relatório Hunter ${index + 1}]: ${resultado}`);
});

console.log(`\nLocalização de Eve após o rastreio: ${eve.getLocalizacao()}`);
