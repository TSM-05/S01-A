data Bebida = Bebida
    { nome  :: String
    , tipo  :: String
    , preco :: Double
    } deriving (Show)

data Status = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

data Pedido = Pedido
    { bebidas :: [Bebida]
    , status  :: Status
    } deriving (Show)


valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido =
    case status pedido of
        Cancelado -> 0.0
        _         -> totalBebidas + taxaServico
    where
        totalBebidas = sum (map preco (bebidas pedido))
        taxaServico  = 5.0

primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case bebidas pedido of
        []    -> "Nenhuma bebida neste pedido."
        (b:_) -> nome b
        

main :: IO ()
main = do
    let cafePuro    = Bebida "Café Puro" "Café" 4.50
    let chaVerde    = Bebida "Chá Verde" "Chá" 6.00
    let sucoLaranja = Bebida "Suco de Laranja" "Suco" 8.00
    
    -- Pedidos de Teste
    let pedidoAberto    = Pedido [cafePuro, chaVerde] Aberto
    let pedidoEntregue  = Pedido [sucoLaranja, cafePuro, chaVerde] Entregue
    let pedidoCancelado = Pedido [sucoLaranja] Cancelado
    let pedidoVazio     = Pedido [] Entregue

    putStrLn "Pedidos:"
    putStr "Valor Pedido Aberto: "
    print (valorTotalPedido pedidoAberto)
    
    putStr "Valor Pedido Entregue: "
    print (valorTotalPedido pedidoEntregue)
    
    putStr "Valor Pedido Cancelado: "
    print (valorTotalPedido pedidoCancelado)
    
    putStrLn "\nBebidas: "
    putStr "Primeira bebida (Aberto): "
    putStrLn (primeiraBebida pedidoAberto)
    
    putStr "Primeira bebida (Entregue): "
    putStrLn (primeiraBebida pedidoEntregue)
    
    putStr "Primeira bebida (Vazio): "
    putStrLn (primeiraBebida pedidoVazio)
