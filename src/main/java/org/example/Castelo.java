package org.example;

import java.util.ArrayList;

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