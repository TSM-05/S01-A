module Rastreavel
  def obter_localizacao(hora)
    "Localização às #{hora}: #{@localizacao}"
  end
end


module Perigoso
  def calcular_risco
    "Alto"
  end
end


class Participante
  attr_reader :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end

  def to_s
    @nome
  end
end


class Detetive < Participante
  include Rastreavel

  def investigar
    "#{@nome} está investigando o caso"
  end
end


class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def planejar_crime
    "#{@nome} está planejando um crime perigoso"
  end
end


class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(participante)
    @participantes << participante
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def listar_participantes
    puts "\n=== Participantes do Cenário ==="
    @participantes.each { |p| puts "  - #{p}" }
  end
end


cenario = Cenario.new

puts "=== Jogo das Sombras ==="
puts "\n--- Configurando Sherlock Holmes ---"
puts "Digite a localização atual de Sherlock:"
localizacao_sherlock = gets.chomp
sherlock = Detetive.new("Sherlock Holmes", localizacao_sherlock)

puts "\n--- Configurando Professor Moriarty ---"
puts "Digite a localização atual de Moriarty:"
localizacao_moriarty = gets.chomp
moriarty = MestreDoCrime.new("Professor Moriarty", localizacao_moriarty)

cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

cenario.listar_participantes

puts "\n=== Identificando Ameaças (Alvos Perigosos) ==="
ameacas = cenario.identificar_ameacas
if ameacas.empty?
  puts "Nenhuma ameaça detectada"
else
  ameacas.each do |ameaca|
    puts "#{ameaca.nome} - Nível de risco: #{ameaca.calcular_risco}"
  end
end



