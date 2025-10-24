class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    @preco_base = preco_base
  end

  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    end
  end

  def to_s
    "#{@nome} - R$ #{preco_base}"
  end
end


class DrinkLenda < Drink
  attr_reader :anos_desde_criacao

  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    preco_base + (@anos_desde_criacao * 5)
  end

  def to_s
    "#{@nome} (Lenda - #{@anos_desde_criacao} anos) - Preço base: R$ #{preco_base} | Preço final: R$ #{preco_final}"
  end
end


class DrinkComum < Drink
  def to_s
    "#{@nome} (Comum) - R$ #{preco_base}"
  end
end


puts "=== Bar AfterLife ==="
puts "\nDigite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base:"
preco_base = gets.chomp.to_f

puts "Digite a idade do drink em anos:"
idade = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco_base, idade)
puts "\n#{drink}"
