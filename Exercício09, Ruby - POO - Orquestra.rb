class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "Método tocar_partitura deve ser implementado nas subclasses"
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    "#{@nome} está tocando #{peca} no piano"
  end
end


class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    "#{@nome} está tocando #{peca} no violino"
  end
end

class Maestro
  attr_reader :musicos

  def initialize
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_ensaio(peca)
    puts "\n=== Iniciando ensaio da peça: #{peca} ==="
    @musicos.each do |musico|
      puts musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
  end
end


maestro = Maestro.new

maestro.adicionar_musico(Pianista.new("Kawarada"))
maestro.adicionar_musico(Violinista.new("Tenzen"))
maestro.adicionar_musico(Pianista.new("Ishin"))
maestro.adicionar_musico(Violinista.new("Kuro"))

puts "=== Orquestra do Maestro ==="
puts "Músicos cadastrados:"
maestro.musicos.each { |m| puts "  - #{m}" }

puts "\nDigite o nome da peça a ser tocada no ensaio:"
peca = gets.chomp

maestro.iniciar_ensaio(peca)

puts "\n=== Mudando o foco dos músicos ==="
mensagens = maestro.mudar_foco("Concentrado")
mensagens.each { |msg| puts msg }
