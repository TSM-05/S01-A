data Item = Item
    { itemNome     :: String
    , itemCategoria :: String 
    , itemPreco    :: Double
    } deriving (Show)

data CompraZelda = CompraZelda
    { itensComprados :: [Item]
    } deriving (Show)


calculaDesconto :: [Item] -> Double
calculaDesconto listaDeItens =
    let total = sum (map itemPreco listaDeItens)
    in if total > 200.0
       then total * 0.10
       else 0.0

valorFinal :: CompraZelda -> Double
valorFinal compra
    | totalItens > 200.0 = totalItens - desconto
    
    | otherwise = totalItens + 15.0
    
    where
        listaDeItens = itensComprados compra
        totalItens = sum (map itemPreco listaDeItens)
        desconto = calculaDesconto listaDeItens

main :: IO ()
main = do
    let espada  = Item "Master Sword" "Arma" 150.0
    let escudo  = Item "Escudo" "Equipamento" 75.0
    let pocao   = Item "Pocao de cura" "Poção" 20.0
    
    let compraGrande = CompraZelda [espada, escudo, pocao]

    putStrLn "** Compra Grande **"
    putStr "Itens: "
    print (map itemNome (itensComprados compraGrande))
    putStr "Valor Final Esperado (Com Desconto, Frete Grátis): "
    print (valorFinal compraGrande)

    putStrLn "\n ** Compra Pequena **"
    let compraPequena = CompraZelda [espada, pocao]
    
    putStr "Itens: "
    print (map itemNome (itensComprados compraPequena))
    putStr "Valor Final Esperado (Com Frete, Sem Desconto): "
    print (valorFinal compraPequena)
