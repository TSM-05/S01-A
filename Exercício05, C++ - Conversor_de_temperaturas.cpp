#include <iostream>

using namespace std;

double celsius_para_fahrenheit(double c){
	
	double f;
	
	f = (9*c/5)+32;
	
	return f;
}

double fahrenheit_para_celsius(double f){
	
	double c; 
	
	c = ((f-32)/9)*5;
	
	return c;
}

int main(){
	
	int k;
	double temp;
	double func;
	
	cout << "Bem-vindo ao conversor de unidades termometricas!" << endl;
	
	do{
		
		cout << "1. Converter Celsius para Fahrenheit" << endl;
		cout << "2. Converter Fahrenheit para Celsius" << endl;	
		cout << "3. Sair" << endl;	
			
		cin >> k;	
		
		switch(k){
			
			case(1):
				cout << "Digite a temperatura em Celsius: ";
				cin >> temp;
				func = celsius_para_fahrenheit(temp);
				cout << "A temperatura respectiva em Fahreinheit e de " << func << " graus!" << endl;    	
				break;
				
				
			case(2):
				cout << "Digite a temperatura em Fahrenheit: ";
				cin >> temp;
				func = fahrenheit_para_celsius(temp);
				cout << "A temperatura respetiva em Celsius e de " << func << " graus!" << endl;    	
				break;
			
			case(3):
				cout << "Programa encerrado!" << endl;		 
				break;
			
			default:
				cout << "Valor invalido digitado!" << endl;
					
		}
		
		
	}while(k != 3);
	
	return 0;
}
