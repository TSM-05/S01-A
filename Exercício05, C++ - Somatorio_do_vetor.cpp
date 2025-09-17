#include <iostream>
#include <iomanip>

using namespace std;

float somarArray(float arr[], int tamanho){
	
	float soma = 0.0;
	
	for(int i = 0; i < tamanho; i++){
		soma = soma + arr[i];	   			
	}
	
	return soma;
	
}

int main(){
	
	int tamanho;
	
	cout << "Digite o tamanho do vetor: ";
	cin >> tamanho;
	
	float vector[tamanho];
	
	cout << "Digite os valores do vetor de " << tamanho << " elementos:" << endl;
	
	for(int i = 0; i < tamanho; i++){
	cin >> vector[i];
	}
	
	cout << fixed << setprecision(2);
	cout << "A soma dos elementos do vetor sera: " << somarArray(vector, tamanho);
	
	return 0;
}
