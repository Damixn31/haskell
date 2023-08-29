-- Ejercicio 6: Crea una función mapCuadrado que aplique el cuadrado a cada elemento de una lista.

mapSquare :: [Int] -> [Int]
mapSquare = map (^2)

main :: IO ()
main = do
    putStrLn "Ingrese una lista de numeros separados por espacios:"
    input <- getLine
    let list = map read (words input) :: [Int] 
    let result = mapSquare list
    putStrLn $ "Lista con cuadrados: " ++ show result
