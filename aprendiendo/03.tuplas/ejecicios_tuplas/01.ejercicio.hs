-- Ejercicio 1: Dada una lista de pares de números, crea una función que calcule la suma de los elementos en cada par y devuelva una lista con las sumas correspondientes.
sumPairs :: [(Int, Int)] -> [Int]
sumPairs pairs = [x + y | (x, y) <- pairs]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de pares de números por ejemplo, [(1,2),(3,4)]"
    input <- getLine
    let pairs = read input :: [(Int, Int)]
    let result = sumPairs pairs
    putStrLn "La suma de los pares es:"
    print result
