#include <iostream>
#include <iomanip>

using namespace std;

int main(){
	
	int size;
	float soma = 0;
	float nota, media;
	
	cout << "Digite o numero de notas a serem inseridas: ";
	cin >> size;
	
	for(int i = 1; i < size+1; i++){
		
		   cout << "Insira a nota " << i << ": ";
		   cin >> nota;
		   
		   while(nota > 10 || nota < 0){
			   cout << "Nota invalida! Digite novamente: ";
			   cin >> nota;
		   }
		   
		   soma += nota;
	}
	
	media = soma/size;
	
	cout << fixed << setprecision(1);
	
	if(media >= 7.0){
		cout << "Aluno Aprovado com media " << media << endl;
	}
	
	else{
		cout << "Aluno Reprovado com media " << media << endl;
	}
	
	return 0;
}
