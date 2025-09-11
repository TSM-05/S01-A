package main

import "fmt"

func main() {
  var numero int
  fmt.Print("Digite um número inteiro: ")
  fmt.Scan(&numero)

  switch numero % 2{
    case 0:
      fmt.Println("O número é Par")
    
    default:
      fmt.Println("O número é Ímpar")
  }
  
}
