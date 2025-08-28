print("Digite o número correspondente ao início do intervalo: ")
local M = io.read("*n")

print("Digite o número correspondente ao fim do intervalo (deve ser maior ou igual ao primeiro número digitado): ")
local N = io.read("*n")

print("Digite o número que deseja encontar os múltiplos: ")
local x = io.read("*n")


local cont = 0

for i = M, N, 1 do
    if i % x == 0 then
        print(i)
        cont = cont + 1
    end
end

print("Foram encontrados "..cont.." múltiplos de "..x.." no intervalo de "..M.." a "..N.."")
