using System;
using System.Collections.Generic;

class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} realiza um ataque!");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança uma rajada de fogo!");
    }
}


class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de água!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("=== BATALHA POKÉMON ===\n");

        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new PokemonDeFogo("Charizard"));
        pokemons.Add(new PokemonDeAgua("Blastoise"));

        Console.WriteLine("Iniciando batalha!\n");
        foreach (Pokemon pokemon in pokemons)
        {
            pokemon.Atacar();
        }

        Console.WriteLine("\n=== FIM DA BATALHA ===");
    }
}
