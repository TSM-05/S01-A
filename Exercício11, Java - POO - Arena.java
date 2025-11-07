import java.util.LinkedHashSet;
import java.util.HashMap;

class PadraoAtaque {
    private String nome;
    private int dano;
    
    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public int getDano() {
        return dano;
    }
    
    public void setDano(int dano) {
        this.dano = dano;
    }
    
    @Override
    public String toString() {
        return nome + " (Dano: " + dano + ")";
    }
}

class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<Ataque> moveset;
    
    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        this.idBoss = id;
        this.pontoFraco = fracoContra;
        this.moveset = new LinkedHashSet<>();
    }
    
    public void adicionarAtaque(Ataque ataque) {
        if (moveset.add(ataque)) {
            System.out.println("  ✓ Ataque adicionado: " + ataque.getNome());
        } else {
            System.out.println("  ⚠️  Ataque já existe no moveset!");
        }
    }
    
    public void iniciarFase() {
        System.out.println("⚔️  Boss " + nome + " iniciou a fase!");
    }
    
    public void exibirMoveset() {
        System.out.println("\n  📋 Moveset de " + nome + ":");
        if (moveset.isEmpty()) {
            System.out.println("    Nenhum ataque disponível.");
            return;
        }
        int contador = 1;
        for (Ataque ataque : moveset) {
            System.out.println("    " + contador + ". " + ataque);
            contador++;
        }
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getIdBoss() {
        return idBoss;
    }
    
    public void setIdBoss(String idBoss) {
        this.idBoss = idBoss;
    }
    
    public String getPontoFraco() {
        return pontoFraco;
    }
    
    public void setPontoFraco(String pontoFraco) {
        this.pontoFraco = pontoFraco;
    }
    
    public LinkedHashSet<Ataque> getMoveset() {
        return moveset;
    }
}

class BossMagico extends Boss {
    
    public BossMagico(String nome, String id, String fracoContra) {
        super(nome, id, fracoContra);
    }
    
    @Override
    public void iniciarFase() {
        System.out.println("✨ Boss Mágico " + getNome() + " conjura feitiços poderosos!");
    }
}

class Ataque {
    private String nome;
    private PadraoAtaque padrao;
    
    public Ataque(String nome, PadraoAtaque padrao) {
        this.nome = nome;
        this.padrao = padrao;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public PadraoAtaque getPadrao() {
        return padrao;
    }
    
    public void setPadrao(PadraoAtaque padrao) {
        this.padrao = padrao;
    }
    
    @Override
    public String toString() {
        return nome + " [" + padrao + "]";
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Ataque ataque = (Ataque) obj;
        return nome.equals(ataque.nome);
    }
    
    @Override
    public int hashCode() {
        return nome.hashCode();
    }
}

class Batalha {
    private HashMap<String, Boss> arena;
    
    public Batalha(HashMap<String, Boss> arena) {
        this.arena = arena;
    }
    
    public void adicionarBoss(Boss boss) {
        if (arena.containsKey(boss.getIdBoss())) {
            System.out.println("❌ Boss já existe na arena: " + boss.getNome());
        } else {
            arena.put(boss.getIdBoss(), boss);
            System.out.println("✓ Boss adicionado à arena: " + boss.getNome() + " [ID: " + boss.getIdBoss() + "]");
        }
    }
    
    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss == null) {
            System.out.println(" Boss não encontrado na arena!");
            return;
        }
        
        System.out.println("Boss: " + boss.getNome());
        System.out.println("ID: " + boss.getIdBoss());
        System.out.println("Ponto Fraco: " + boss.getPontoFraco());
        boss.iniciarFase();
        boss.exibirMoveset();
    }
    
    public void exibirArena() {
        
        if (arena.isEmpty()) {
            System.out.println("Nenhum boss registrado.");
            return;
        }
        
        int contador = 1;
        for (HashMap.Entry<String, Boss> entry : arena.entrySet()) {
            Boss boss = entry.getValue();
            System.out.println("\n[" + contador + "] " + boss.getNome());
            System.out.println("    ID: " + boss.getIdBoss());
            System.out.println("    Ponto Fraco: " + boss.getPontoFraco());
            System.out.println("    Ataques: " + boss.getMoveset().size());
            contador++;
        }
    }
    
    public HashMap<String, Boss> getArena() {
        return arena;
    }
    
    public void setArena(HashMap<String, Boss> arena) {
        this.arena = arena;
    }
}

// Classe principal
public class ArenaBoss {
    public static void main(String[] args) {
        
        PadraoAtaque padrao1 = new PadraoAtaque("Ataque Frontal", 50);
        PadraoAtaque padrao2 = new PadraoAtaque("Ataque em Área", 75);
        PadraoAtaque padrao3 = new PadraoAtaque("Feitiço Arcano", 100);
        PadraoAtaque padrao4 = new PadraoAtaque("Combo Rápido", 40);
        
        Ataque espada = new Ataque("Golpe de Espada", padrao1);
        Ataque explosao = new Ataque("Explosão Mágica", padrao2);
        Ataque raio = new Ataque("Raio Arcano", padrao3);
        Ataque investida = new Ataque("Investida Brutal", padrao4);
        
        Boss dragonKing = new Boss("Dragon King", "BOSS-001", "Gelo");
        BossMagico archmage = new BossMagico("Archmage Malzahar", "BOSS-002", "Anti-Magia");
        Boss shadowLord = new Boss("Shadow Lord", "BOSS-003", "Luz");
        
        System.out.println("Configurando moveset dos bosses...\n");
        System.out.println("Dragon King:");
        dragonKing.adicionarAtaque(espada);
        dragonKing.adicionarAtaque(investida);
        dragonKing.adicionarAtaque(explosao);
        
        System.out.println("\nArchmage Malzahar:");
        archmage.adicionarAtaque(raio);
        archmage.adicionarAtaque(explosao);
        archmage.adicionarAtaque(raio); // Tentando adicionar duplicado
        
        System.out.println("\nShadow Lord:");
        shadowLord.adicionarAtaque(investida);
        shadowLord.adicionarAtaque(espada);
        
    
        HashMap<String, Boss> arenaMap = new HashMap<>();
        Batalha batalha = new Batalha(arenaMap);
        
        System.out.println("\n Adicionando bosses à arena... \n");
        batalha.adicionarBoss(dragonKing);
        batalha.adicionarBoss(archmage);
        batalha.adicionarBoss(shadowLord);
        batalha.adicionarBoss(dragonKing); // Tentando adicionar duplicado
        
        batalha.exibirArena();
        
        System.out.println("\n" + "=".repeat(45));
        batalha.iniciarBatalha("BOSS-001");
        
        System.out.println("\n" + "=".repeat(45));
        batalha.iniciarBatalha("BOSS-002");
        
        System.out.println("\n" + "=".repeat(45));
        batalha.iniciarBatalha("BOSS-999"); // Boss inexistente
    }
}
