#include <iostream>
#include <list>

using namespace std;

class SerVivo{
public:
	string nome;
	
	
	SerVivo(string nome){
		this -> nome = nome;
	}	
	
	
	virtual	void apresentar(){
		cout << "Oi, me chamo " << nome << endl;
	}
		
};

class Humano : public SerVivo{
public:
	
	Humano(string nome) : SerVivo(nome){}
	
	void apresentar(){
		cout << "Ola, me chamo " << nome << ", sou humano e vivo em Skyrim" << endl;
	}
			
};

class Elfo : public SerVivo{
public:
	
	Elfo(string nome) : SerVivo(nome){}
	
	void apresentar(){
		cout << "Ola, me chamo " << nome << ", sou um elfo perito em combate com arco e flecha" << endl;
	}
};

class Fada : public SerVivo{
public:
	
	Fada(string nome) : SerVivo(nome){}
	
	void apresentar(){
		cout << "Ola, me chamo " << nome << ", sou uma fada e possuo poderes incriveis" << endl;
	}
	
};



int main(){
	
	list<SerVivo*> personagens;
	
	SerVivo* humano = new Humano("Bjorn");
    SerVivo* elfo = new Elfo("Legolas");
    SerVivo* fada = new Fada("Myxplix");
    
    personagens.push_back(humano);
    personagens.push_back(elfo);
    personagens.push_back(fada);
    
    
    int contador = 1;
    for (list<SerVivo*>::iterator it = personagens.begin(); it != personagens.end(); ++it) {
        cout << "Ser Vivo " << contador << ":" << endl;
        (*it)->apresentar();
        cout << endl;
        contador++;
	}
	
	for (list<SerVivo*>::iterator it = personagens.begin(); it != personagens.end(); ++it) {
        delete *it;
    }
	
	
	return 0;
	
}
