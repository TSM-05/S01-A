data Banda = Banda
    { nomeBanda   :: String
    , genero      :: String
    , cache       :: Double
    } deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento
    { listaBandas :: [Banda]
    , statusEvento :: StatusEvento
    } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento =
    case statusEvento evento of
        Cancelado -> 0.0
        _         -> totalCaches * (1.0 + taxaProducao)
    where
        totalCaches  = sum (map cache (listaBandas evento))
        taxaProducao = 0.20

bandaAbertura :: Evento -> String
bandaAbertura evento =
    case listaBandas evento of
        []    -> "Nenhuma banda programada."
        (b:_) -> nomeBanda b


bandaFechamento :: Evento -> String
bandaFechamento evento =
    case reverse (listaBandas evento) of
        []    -> "Nenhuma banda programada."
        (b:_) -> nomeBanda b


main :: IO ()
main = do
    let bandaRock  = Banda "Bon Jovi" "Rock" 10000.00
    let bandaRock2   = Banda "Dire Straits" "Rock" 5000.00
    let bandaPop  = Banda "Bruno Mars" "Pop" 2500.00
    
    let bandasDoEvento = [bandaRock, bandaRock2, bandaPop]

    let eventoAtivo    = Evento bandasDoEvento Ativo
    let eventoEncerrado = Evento [bandaPop, bandaRock] Encerrado
    let eventoCancelado = Evento bandasDoEvento Cancelado

    putStrLn " ** Análise de Eventos **"
    
    putStrLn "\n-> Evento 1 (Ativo)"
    putStrLn $ "Banda de Abertura: " ++ bandaAbertura eventoAtivo
    putStrLn $ "Banda de Fechamento: " ++ bandaFechamento eventoAtivo
    
    putStr "Custo Total: "
    print (custoTotalEvento eventoAtivo)

    putStrLn "\n-> Evento 2 (Encerrado)"
    putStrLn $ "Banda de Abertura: " ++ bandaAbertura eventoEncerrado
    putStr "Custo Total: "
    print (custoTotalEvento eventoEncerrado)

    putStrLn "\n-> Evento Cancelado"
    putStr "Custo Total: "
    print (custoTotalEvento eventoCancelado)
