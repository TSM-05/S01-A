using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio
{
    private List<Feitico> feiticos;

    public Grimorio()
    {
        feiticos = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico feitico)
    {
        feiticos.Add(feitico);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("\nFeitiços no Grimório:");
        if (feiticos.Count == 0)
        {
            Console.WriteLine("Nenhum feitiço no grimório.");
        }
        else
        {
            foreach (Feitico feitico in feiticos)
            {
                Console.WriteLine($"- {feitico.Nome}");
            }
        }
    }
}

class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

class Maga
{
    public string Nome { get; set; }
    private Grimorio grimorio;
    private List<Ferramenta> ferramentas;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.grimorio = new Grimorio(); 
        this.ferramentas = new List<Ferramenta>();
    }

    public Maga(string nome, List<Ferramenta> ferramentasExternas) : this(nome)
    {
        this.ferramentas = ferramentasExternas; 
    }

    public void AprenderFeitico(Feitico feitico)
    {
        grimorio.AdicionarFeitico(feitico);
    }

    public void AdicionarFerramenta(Ferramenta ferramenta)
    {
        ferramentas.Add(ferramenta);
        Console.WriteLine($"{Nome} adquiriu: {ferramenta.Nome}");
    }

    public void MostrarInventario()
    {
        Console.WriteLine($"MAGA: {Nome}");
        
        grimorio.ListarFeiticos();

        Console.WriteLine("\nFerramentas de Sobrevivência:");
        if (ferramentas.Count == 0)
        {
            Console.WriteLine("Nenhuma ferramenta.");
        }
        else
        {
            foreach (Ferramenta ferramenta in ferramentas)
            {
                Console.WriteLine($"- {ferramenta.Nome}");
            }
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Ferramenta> ferramentasDisponiveis = new List<Ferramenta>();
        ferramentasDisponiveis.Add(new Ferramenta("Capacete de Ferro"));
        ferramentasDisponiveis.Add(new Ferramenta("Lanterna Mágica"));
        ferramentasDisponiveis.Add(new Ferramenta("Bússola Encantada"));

        Maga frieren = new Maga("Frieren", ferramentasDisponiveis);
		
        frieren.AprenderFeitico(new Feitico("Ogof megavles(Destruição)"));
        frieren.AprenderFeitico(new Feitico(" Arierrab Acitsim (Defesa)"));
        frieren.AprenderFeitico(new Feitico("Aruc (Cura)"));

        frieren.MostrarInventario();
    }
}
