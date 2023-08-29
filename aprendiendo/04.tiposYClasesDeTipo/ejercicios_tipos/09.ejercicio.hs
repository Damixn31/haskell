-- Ejercicio 9: Crea una función sumaPares que sume los elementos pares de una lista de números.

thisPar :: Int -> Bool
thisPar n = n `mod` 2 == 0

sumPar :: [Int] -> Int
sumPar = sum . filter thisPar

main :: IO ()
main = do
    putStrLn "Ingrese una lista de numeros separados por espacios:"
    input <- getLine
    let list = map read (words input) :: [Int] 
    let sum = sumPar list
    putStrLn $ "esta es la suma de numeros pares: " ++ show sum
