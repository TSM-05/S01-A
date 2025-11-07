package org.example;

import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;
    
    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }
    
    public double calcularPrecoFinal() {
        return precoBase;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public double getPrecoBase() {
        return precoBase;
    }
    
    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;
    
    public CafeGourmet(String nome, double preco, double bonus) {
        super(nome, preco);
        this.bonusAroma = bonus;
    }
    
    @Override
    public double calcularPrecoFinal() {
        return getPrecoBase() + bonusAroma;
    }
    
    public double getBonusAroma() {
        return bonusAroma;
    }
    
    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;
    
    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }
    
    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
    
    public ArrayList<Cafe> getItens() {
        return itens;
    }
    
    public void setItens(ArrayList<Cafe> itens) {
        this.itens = itens;
    }
}

class CafeLeblanc {
    private Menu menu;
    
    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }
    
    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome() + 
                         " - Preço: R$ " + cafe.calcularPrecoFinal());
    }
    
    public Menu getMenu() {
        return menu;
    }
    
    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}

class Main {
    public static void main(String[] args) {
        
        Cafe cafeSimples = new Cafe("Café Expresso", 5.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Café Especial", 8.00, 2.50);
        
        
        ArrayList<Cafe> itensCafe = new ArrayList<>();
        itensCafe.add(cafeSimples);
        itensCafe.add(cafeGourmet);
        Menu menu = new Menu(itensCafe);
        
        CafeLeblanc leblanc = new CafeLeblanc(menu);
        
        System.out.println("Cafeteria LeBlanc");
        leblanc.receberPedido(cafeSimples);
        leblanc.receberPedido(cafeGourmet);
        
        System.out.println("\n=== Demonstração de Polimorfismo ===");
        System.out.println("Café Simples - Preço: R$ " + cafeSimples.calcularPrecoFinal());
        System.out.println("Café Gourmet - Preço: R$ " + cafeGourmet.calcularPrecoFinal());
    }
}
