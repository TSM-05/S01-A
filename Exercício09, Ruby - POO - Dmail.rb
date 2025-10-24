class MicroondasUnidade
  def aquecer_por
    "Aquecendo por 2 minutos"
  end

  def to_s
    "Unidade de Microondas"
  end
end


class DMail
  attr_accessor :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "[#{@hora_envio}] #{@conteudo}"
  end
end


class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails = []
  end

  def enviar_dmail
    puts "Digite o conteúdo do D-Mail:"
    conteudo = gets.chomp

    puts "Digite a hora de envio (ex: 10:30 - obs: não se esqueça do 0 caso o número seja < 10):"
    hora_envio = gets.chomp

    @unidade.aquecer_por

    dmail = DMail.new(conteudo, hora_envio)
    @dmails << dmail

    puts "\nD-Mail enviado com sucesso!"
    puts dmail
  end

  def listar_dmails(horario_corte)
    puts "\n=== D-Mails após #{horario_corte} ==="
    dmails_filtrados = @dmails.select { |dmail| dmail.hora_envio > horario_corte }

    if dmails_filtrados.empty?
      puts "Nenhum D-Mail encontrado após #{horario_corte}"
    else
      dmails_filtrados.each { |dmail| puts dmail }
    end

    dmails_filtrados
  end
end


telefone = TelefoneDeMicroondas.new

puts "=== TelefoneDeMicroondas - Sistema D-Mail ==="
puts "\nEnviando D-Mails..."

# Enviar alguns D-Mails
3.times do |i|
  puts "\n--- D-Mail #{i + 1} ---"
  telefone.enviar_dmail
end

puts "\n\nDigite um horário de corte para filtrar D-Mails (ex: 12:00):"
horario_corte = gets.chomp

telefone.listar_dmails(horario_corte)
