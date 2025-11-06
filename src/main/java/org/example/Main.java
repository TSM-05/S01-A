package org.example;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args)
    {
        // Criação de personagens
        Personagem sophie = new Personagem("Percy", 21);
        Mago howl = new Mago("Atkos", 87, "Feitiço do Fogo");

        // Criação de divisões do castelo
        ArrayList<Divisao> divisoes = new ArrayList<>();
        divisoes.add(new Divisao("Sala Principal"));
        divisoes.add(new Divisao("Quarto de Howl"));
        divisoes.add(new Divisao("Cozinha"));

        Castelo castelo = new Castelo("Castelo Animado", divisoes);
        
        castelo.adicionarDivisao(new Divisao("Torre"));

        // Testando
        System.out.println("Personagem: " + sophie.getNome());
        System.out.println("Mago: " + howl.getNome() + " - " + howl.lancarFeitico());
        System.out.println("Castelo: " + castelo.getNome() + " com " +
                castelo.getDivisoes().size() + " divisões");
    }
}