local tabela1 = {}

print("Insira números para a tabela (digite 0 para encerrar):")

while true do
    local num = io.read("*n")
    if num == 0 then
        break
    end
    table.insert(tabela1, num)
end

function Pares(tabela)
    local pares = {}
    for i = 1, #tabela do
        if tabela[i] % 2 == 0 then
            table.insert(pares, tabela[i])
        end
    end
    return pares
end

local tabela2 = Pares(tabela1)

print("\nTabela original: ")
for i = 1, #tabela1 do
    io.write(tabela1[i] .. " ")
end

print("\n\nTabela apenas com números pares: ")
for i = 1, #tabela2 do
    io.write(tabela2[i] .. " ")
end
