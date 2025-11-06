import java.util.ArrayList;

// estrutura

public class Personagem {
    private String nome;
    private int idade;
    
    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public int getIdade() {
        return idade;
    }
    
    public void setIdade(int idade) {
        this.idade = idade;
    }
}

public class Mago extends Personagem {
    private String magia;
    
    public Mago(String nome, int idade) {
        super(nome, idade);
    }
    
    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }
    
    public String lancarFeitico() {
        return magia;
    }
    
    public String getMagia() {
        return magia;
    }
    
    public void setMagia(String magia) {
        this.magia = magia;
    }
}

public class Divisao {
    private String nome;
    
    public Divisao(String nome) {
        this.nome = nome;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
}

public class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;
    
    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }
    
    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }
    
    public void setDivisoes(ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }
}

public class Main {
    public static void main(String[] args) {
        // Criando personagens
        Personagem sophie = new Personagem("Sophie", 18);
        Mago howl = new Mago("Howl", 27, "Feitiço do Fogo");
        
        // Criando divisões do castelo
        ArrayList<Divisao> divisoes = new ArrayList<>();
        divisoes.add(new Divisao("Sala Principal"));
        divisoes.add(new Divisao("Quarto de Howl"));
        divisoes.add(new Divisao("Cozinha"));
        
        
        Castelo castelo = new Castelo("Castelo Animado", divisoes);
        
      
        castelo.adicionarDivisao(new Divisao("Torre"));
        
        System.out.println("Personagem: " + sophie.getNome());
        System.out.println("Mago: " + howl.getNome() + " - " + howl.lancarFeitico());
        System.out.println("Castelo: " + castelo.getNome() + " com " + 
                           castelo.getDivisoes().size() + " divisões");
    }
}
