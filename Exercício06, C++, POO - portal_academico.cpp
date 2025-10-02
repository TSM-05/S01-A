#include <iostream>

using namespace std;

class Pessoa{
public:
	string nome;
	
	Pessoa(string nome){
		this -> nome = nome;
	}
	
	virtual void apresentar(){
		cout << "Ola, meu nome e " << nome << " e eu sou uma pessoa." << endl; 
	}
};

class Professor : public Pessoa{
public:
	string disciplina;
	
	Professor(string nome, string disciplina) : Pessoa(nome){
		this -> disciplina = disciplina;
	}
	
	void apresentar(){ // override nao foi utilizado pois o compilador nao reconhecia
		cout << "Ola, meu nome e " << nome << " e eu sou professor de " << disciplina << endl; 
	} 
		
};

class Aluno : public Pessoa{
public:
	string curso;
	int matricula;
	
	Aluno(string nome, string curso, int matricula) : Pessoa(nome){
		this -> curso = curso;
		this -> matricula = matricula;
	} 
	
	void apresentar(){
		cout << "Ola, meu nome e " << nome << " e eu sou aluno de " << curso << endl;
	}
	
};


int main()
{
	Pessoa* p1;
	Pessoa* p2;
	
	p1 = new Professor("Luis Felipe", "Calculo");
	p2 = new Aluno("Teo", "Software", 673);
	
	p1->apresentar();
	p2->apresentar();
	
	delete p1;
	delete p2;
	
	return 0;
}
