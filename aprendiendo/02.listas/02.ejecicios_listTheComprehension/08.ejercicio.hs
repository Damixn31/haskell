-- Dada una lista de números, crea una nueva lista que contenga solo los números pares.
listsNums :: [Int] -> [Int]
listsNums nums = [x | x <- nums, even x]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de numeros separados por espacios:"
    input <- getLine
    let list = map read (words input)
    let numsEven = listsNums list
    putStrLn "Lista original:"
    print list
    putStrLn "Lista de nuemero pares:"
    print numsEven
