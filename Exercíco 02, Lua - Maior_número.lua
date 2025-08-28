function biggest(tab)
    local maior = tab[1]
    for i = 2, #tab do
        if tab[i] > maior then
            maior = tab[i]
        end
    end
    return maior
end

local tabela = {}

print("Digite números (digite 0 para parar):")
while true do
    local valor = io.read("*n")
    if valor == 0 then
        break
    end
    table.insert(tabela, valor)
end

print("O maior número digitado foi: " .. biggest(tabela))
