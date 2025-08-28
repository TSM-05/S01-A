function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b == 0 then
            return "Erro: divisão por zero não é válida"
        end
        return a / b
    else
        return "Erro: operador inválido"
    end
end

print("Digite o primeiro número:")
local num1 = tonumber(io.read())

print("Digite o segundo número:")
local num2 = tonumber(io.read())

print("Digite o operador (+, -, *, /):")
local op = io.read()

local resultado = calculadora(num1, num2, op)
print("Resultado: " .. tostring(resultado))
