use std::io;

fn eh_par(n: i32) -> bool {
    n % 2 == 0
}

fn main() {
    println!("Boas-vindas ao jogo de Par ou Ímpar!");

    println!("Jogador 1, digite P para Par ou I para Ímpar:");
    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Falha ao ler a linha");
    let escolha = escolha.trim().to_uppercase(); // remove \n e garante maiúscula

    
    println!("Jogador 1, digite um número de 0 a 10:");
    let mut entrada1 = String::new();
    io::stdin()
        .read_line(&mut entrada1)
        .expect("Falha ao ler a linha");
    let j1: i32 = entrada1.trim().parse().expect("Digite um número válido");

    
    println!("Jogador 2, digite um número de 0 a 10:");
    let mut entrada2 = String::new();
    io::stdin()
        .read_line(&mut entrada2)
        .expect("Falha ao ler a linha");
    let j2: i32 = entrada2.trim().parse().expect("Digite um número válido");


    let res = j1 + j2;

    if eh_par(res) {
        if escolha == "P" {
            println!("Jogador 1 ganhou, pois {} + {} = {}, que é par!", j1, j2, res);
        } else {
            println!("Jogador 2 ganhou, pois {} + {} = {}, que é par!", j1, j2, res);
        }
    } else {
        if escolha == "I" {
            println!("Jogador 1 ganhou, pois {} + {} = {}, que é ímpar!", j1, j2, res);
        } else {
            println!("Jogador 2 ganhou, pois {} + {} = {}, que é ímpar!", j1, j2, res);
        }
    }
}
