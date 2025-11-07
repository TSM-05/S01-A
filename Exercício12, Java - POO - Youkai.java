import java.util.HashMap;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;
    
    public Poder(String nome) {
        this.nome = nome;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
}

abstract class Entidades implements Rastreavel {
    private String nome;
    private String localizacao;
    
    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
    }
    
    @Override
    public String obterCoordenadas() {
        return localizacao;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getLocalizacao() {
        return localizacao;
    }
    
    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }
}

class Youkai extends Entidades {
    private Poder poder;
    
    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
        this.poder = poder;
    }
    
    public Poder getPoder() {
        return poder;
    }
    
    public void setPoder(Poder poder) {
        this.poder = poder;
    }
}

class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;
    
    public Alien(String nome, String planeta, String ovni) {
        super(nome, planeta, null);
        this.planetaOrigem = planeta;
        this.ovni = ovni;
    }
    
    public String getPlanetaOrigem() {
        return planetaOrigem;
    }
    
    public void setPlanetaOrigem(String planetaOrigem) {
        this.planetaOrigem = planetaOrigem;
    }
    
    public String getOvni() {
        return ovni;
    }
    
    public void setOvni(String ovni) {
        this.ovni = ovni;
    }
}

class Registros {
    private String nomeEquipe;
    private HashMap<Entidades, String> avistamentos;
    
    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }
    
    public boolean registrarAvistamento(Entidades entidade, String nome) {
        // Verifica se a entidade já foi registrada
        if (avistamentos.containsKey(entidade)) {
            System.out.println("⚠️  Entidade já registrada!");
            return false;
        }
        
        avistamentos.put(entidade, nome);
        System.out.println("✓ Avistamento registrado: " + nome);
        return true;
    }
    
    public void exibirRegistros() {
        
        if (avistamentos.isEmpty()) {
            System.out.println("Nenhum avistamento registrado.");
            return;
        }
        
        int contador = 1;
        for (HashMap.Entry<Entidades, String> entry : avistamentos.entrySet()) {
            Entidades entidade = entry.getKey();
            String identificador = entry.getValue();
            
            System.out.println("\n[" + contador + "] " + identificador);
            System.out.println("    Nome: " + entidade.getNome());
            System.out.println("    Tipo: " + entidade.getClass().getSimpleName());
            System.out.println("    Localização: " + entidade.obterCoordenadas());
            
            if (entidade instanceof Youkai) {
                Youkai y = (Youkai) entidade;
                System.out.println("    Poder: " + y.getPoder().getNome());
            } else if (entidade instanceof Alien) {
                Alien a = (Alien) entidade;
                System.out.println("    Planeta: " + a.getPlanetaOrigem());
                System.out.println("    OVNI: " + a.getOvni());
            }
            
            contador++;
        }
    }
    
    public String getNomeEquipe() {
        return nomeEquipe;
    }
    
    public void setNomeEquipe(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
    }
    
    public HashMap<Entidades, String> getAvistamentos() {
        return avistamentos;
    }
}

// Classe principal
public class RegistroOculto {
    public static void main(String[] args) {
       
        Registros registros = new Registros("Detetives Ocultos");
        
        Poder poderFogo = new Poder("Controle de Fogo");
        Poder poderIlusao = new Poder("Ilusões Mentais");
        Poder poderVento = new Poder("Manipulação de Vento");
        
        
        Youkai kitsune = new Youkai("Kitsune", "34.6937°N, 135.5023°E", poderIlusao);
        Youkai tengu = new Youkai("Tengu", "35.6762°N, 139.6503°E", poderVento);
        Youkai oni = new Youkai("Oni", "36.2048°N, 138.2529°E", poderFogo);
        
        // Criando Aliens
        Alien grey = new Alien("Grey", "Zeta Reticuli", "OVNI-Alpha-01");
        Alien reptiliano = new Alien("Reptiliano", "Alpha Draconis", "OVNI-Delta-03");
        
        registros.registrarAvistamento(kitsune, "YOUKAI-001");
        registros.registrarAvistamento(tengu, "YOUKAI-002");
        registros.registrarAvistamento(oni, "YOUKAI-003");
        registros.registrarAvistamento(grey, "ALIEN-001");
        registros.registrarAvistamento(reptiliano, "ALIEN-002");
      
        registros.exibirRegistros();
        
        Rastreavel entidade1 = kitsune;
        Rastreavel entidade2 = grey;
        System.out.println("Coordenadas Kitsune: " + entidade1.obterCoordenadas());
        System.out.println("Coordenadas Grey: " + entidade2.obterCoordenadas());
    }
  
}
