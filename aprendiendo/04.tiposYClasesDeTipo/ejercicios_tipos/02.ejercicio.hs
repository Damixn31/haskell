-- Ejercicio 2: Implementa una función calcularArea que calcule el área de un círculo dado su radio.

calcularArea :: Double -> Double
calcularArea radio = pi * radio^2

main :: IO ()
main = do
    putStrLn "Ingrese un numero:"
    input <- getLine
    let num = read input :: Double
    let result = calcularArea num
    putStrLn "El area del numero es:" 
    print result

