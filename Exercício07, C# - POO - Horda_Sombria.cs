using System;

abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public abstract void Mover();
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome)
    {
    }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} se arrasta lentamente...");
    }
}

class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome)
    {
    }

    
    public override void Mover()
    {
        Console.WriteLine($"{Nome} flutua rapidamente pelo ar!");
    }
}

class Program
{
    static void Main(string[] args)
    {

        MonstroSombrio[] hordaSombria = new MonstroSombrio[4];

        hordaSombria[0] = new Zumbi("Larry");
        hordaSombria[1] = new Espectro("Spcetre");
        hordaSombria[2] = new Zumbi("Josh");
        hordaSombria[3] = new Espectro("Gárgula");

        Console.WriteLine("ALERTA: Horda detectada!\n");
        Console.WriteLine("Os monstros estão se aproximando...\n");

        foreach (MonstroSombrio monstro in hordaSombria)
        {
            monstro.Mover();
        }

    }
}
