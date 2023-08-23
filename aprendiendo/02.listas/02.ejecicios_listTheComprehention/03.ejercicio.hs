-- Dada una lista de números, calcula la suma de todos los números impares
listNum :: [Int] -> Int
listNum nums = sum [x | x <- nums, odd x]

main :: IO ()
main = do
    putStrLn "Ingresa una lista de numeros separados por espacios:"
    input <- getLine
    let nums = map read (words input)
    let sumImpar = listNum nums
    putStrLn "Lista original:"
    print nums
    putStrLn "Lista de suma de numeros impares:"
    print sumImpar
