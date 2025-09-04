use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let media = ((nota1 * 2.0) + (nota2 * 3.0) + (nota3 * 5.0)) / 10.0;
    media
}

fn main() {
    let mut nota1 = String::new();
    let mut nota2 = String::new();
    let mut nota3 = String::new();

    println!("Digite a primeira nota: ");
    io::stdin()
        .read_line(&mut nota1)
        .expect("Falha ao ler a entrada");
    let nota1: f64 = nota1.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite a segunda nota: ");
    io::stdin()
        .read_line(&mut nota2)
        .expect("Falha ao ler a entrada");
    let nota2: f64 = nota2.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite a terceira nota: ");
    io::stdin()
        .read_line(&mut nota3)
        .expect("Falha ao ler a entrada");
    let nota3: f64 = nota3.trim().parse().expect("Por favor, digite um número válido");

    let media = calcular_media(nota1, nota2, nota3);
    println!("A média ponderada é: {:.2}", media);

    if media >= 7.0 {
        println!("Aluno aprovado!");
    } else {
        println!("Aluno reprovado!");
    }
}
