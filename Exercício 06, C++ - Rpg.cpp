#include <iostream>

using namespace std;

class Personagem{
public:
	string nome;
	int nivel, dano, vida;
	
	
	Personagem (string nome, int nivel, int dano, int vida){
		this -> nome = nome;
		this -> nivel = nivel;
		this -> dano = dano;
		this -> vida = vida;
	}
		
	
    void atacar(Personagem& alvo) {
        cout << "\n" << nome << " ataca " << alvo.nome << "!" << endl;
        alvo.vida -= dano;
        cout << alvo.nome << " recebeu " << dano << " de dano!" << endl;
        
        if (alvo.vida <= 0) {
            alvo.vida = 0;
            cout << alvo.nome << " foi derrotado!" << endl;
        } else {
            cout << alvo.nome << " ainda tem " << alvo.vida << " pontos de vida." << endl;
        }
        
        cout << nome << " ainda tem " << vida << " pontos de vida" << endl;
    }
};

int main()
{
	
	Personagem gigante("Gigante eletrico", 55, 120, 400);
	Personagem construto("Besta", 40, 80, 300);
	
	gigante.atacar(construto);
	
	return 0;
}
