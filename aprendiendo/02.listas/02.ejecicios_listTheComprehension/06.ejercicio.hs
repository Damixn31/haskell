-- Dada una lista de números, encuentra todos los números mayores que 10 y luego calcula su duplicado.
listNumber :: [Int] -> [Int]
listNumber nums = [x * 2 | x <- nums, x > 10]

main :: IO ()
main = do
    putStrLn "Ingresa una lista numeros separados:"
    input <- getLine
    let nums = map read (words input)
    let moreTenDuplicate = listNumber nums
    putStrLn "Lista original:"
    print nums
    putStrLn "Lista de numeros matores a 10"
    print moreTenDuplicate
