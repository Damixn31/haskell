-- dada una lista de numeros, crea una nueva lista que contenga el cuadrado de cada numero en la lista original.

squaredList :: [Int] -> [Int]
squaredList nums = [x * x | x <- nums]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de numeros separados por espacios: "
    input <- getLine
    let nums = map read (words input)
    let squared = squaredList nums
    putStrLn "Lista original: "
    print nums
    putStrLn "Lista de cuadrados: "
    print squared
    
