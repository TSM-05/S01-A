#include <iostream>

using namespace std;

int fibonacci(int n){
	
	if(n == 0){
		return 0;
	}
	
	else if(n == 1){
		return 1;	
	}
	
	else{
		return fibonacci(n-1) + fibonacci(n-2);
	}
	
	
}

int main(){
	
	int n; 
	
	cout << "Digite o numero cujo fibonnaci deseja exibir" << endl;
	cin >> n;
	
	cout << "O fibonacci de " << n << " = " << fibonacci(n) << endl;
	
	
	return 0;
}
