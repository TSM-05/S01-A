#include <iostream>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;
    
public:
    Pessoa(string nome, int idade) {
        this->nome = nome;
        this->idade = idade;
    }
    
    
    string getNome() {
        return nome;
    }
    
    int getIdade() {
        return idade;
    }
    
    
    void setNome(string nome) {
        this->nome = nome;
    }
    
    void setIdade(int idade) {
        this->idade = idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;
    
public:
    
    Protagonista(string nome, int idade, int nivel) : Pessoa(nome, idade) {
        this->nivel = nivel;
    }
    
    
    int getNivel() {
        return nivel;
    }
    
    void setNivel(int nivel) {
        this->nivel = nivel;
    }
    
};

class Personagem : public Pessoa {
private:
    int rank;
    
public:
    
    Personagem(string nome, int idade, int rank) : Pessoa(nome, idade) {
        if (rank < 0) {
            this->rank = 0;
        } else if (rank > 10) {
            this->rank = 10;
        } else {
            this->rank = rank;
        }
    }
    
    int getRank() {
        return rank;
    }
    
    void setRank(int rank) {
        if (rank >= 0 && rank <= 10) {
            this->rank = rank;
        } else {
            cout << "Rank deve estar entre 0 e 10!" << endl;
        }
    }
    
};

int main() {
    
    Protagonista heroi("Batman", 32, 95);
    Personagem vilao("Coringa", 50, 8);  // Rank deve ser 0-10
    
    cout << "---- Protagonista ----" << endl;
    cout << "Nome: " << heroi.getNome() << endl;
    cout << "Idade: " << heroi.getIdade() << endl;
    cout << "Nivel: " << heroi.getNivel() << endl;
    
    cout << "---- Personagem ----" << endl;
    cout << "Nome: " << vilao.getNome() << endl;
    cout << "Idade: " << vilao.getIdade() << endl;
    cout << "Rank: " << vilao.getRank() << "/10" << endl;
    
    return 0;
}
