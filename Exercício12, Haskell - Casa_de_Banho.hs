data Servico = Servico
    { servicoNome :: String
    , servicoTipo :: String
    , precoBase   :: Double
    } deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento
    { listaServicos :: [Servico]
    , statusAtendimento :: StatusAtendimento
    } deriving (Show)


bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista =
    let
        totalInicial = sum (map precoBase lista)
        numServicos  = length lista
        
        totalComBonus = if numServicos > 3
                        then totalInicial * 1.25
                        else totalInicial
                        
        valorFinalizado = if totalComBonus > 500.0
                          then totalComBonus * 0.90
                          else totalComBonus
    in
        valorFinalizado

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | statusAtendimento atendimento == Cancelado = 0.0
    | otherwise = bonusEspiritual (listaServicos atendimento)


descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico atendimento =
    case listaServicos atendimento of
        []    -> "Nenhum serviço agendado"
        (s:_) -> servicoNome s ++ " (" ++ servicoTipo s ++ ")"


main :: IO ()
main = do

    let banhoLuxo     = Servico "Banho de Cristal" "Banho" 150.0
    let massagemPedras = Servico "Massagem de Pedras ancentrais" "Massagem" 120.0
    let banqueteOuro   = Servico "Banquete de Ouro" "Banquete" 300.0
    let esfoliacao     = Servico "Esfoliação de Areia das almas" "Banho" 80.0
    let quiropraxia    = Servico "Ajuste de Quiro" "Massagem" 130.0
    
    let lista1 = [massagemPedras, banhoLuxo, banqueteOuro, esfoliacao, quiropraxia]
    let atendimentoA = Atendimento lista1 Finalizado
    
    let lista2 = [banhoLuxo, banqueteOuro]
    let atendimentoB = Atendimento lista2 Cancelado

    let atendimentoC = Atendimento [banqueteOuro] EmAndamento

    putStrLn "-*- Atendimentos da Casa de Banhos -*-"
    
    putStrLn "\n => Atendimento 1 - Completo (Bónus + Desconto)"
    putStrLn $ "Primeiro Serviço: " ++ descricaoPrimeiroServico atendimentoA
    putStr "Valor Final: "
    print (valorFinalAtendimento atendimentoA)

    putStrLn "\n => Atendimento 2 - Cancelado"
    putStrLn $ "Primeiro Serviço: " ++ descricaoPrimeiroServico atendimentoB
    putStr "Valor Final: "
    print (valorFinalAtendimento atendimentoB)

    putStrLn "\n => Atendimento 3 - Simples"
    putStrLn $ "Primeiro Serviço: " ++ descricaoPrimeiroServico atendimentoC
    putStr "Valor Final: "
    print (valorFinalAtendimento atendimentoC)
