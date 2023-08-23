-- Dada una lista de listas, concatena todos los elementos en una sola lista.
-- nota
-- En Haskell, no es trivial ingresar directamente una lista de listas desde la consola debido a la complejidad de la representación. Para hacerlo de manera más simple, podríamos considerar ingresar una lista de números y luego convertirla en una lista de listas.
--
concatList :: [[a]] -> [a]
concatList lists = [x | subList <- lists, x <- subList]

parseList :: String -> [Int]
parseList str = read ("[" ++ str ++ "]")

main :: IO ()
main = do
    putStrLn "Ingrese una lista de numeros separados por espacios:"
    input <- getLine
    let numbers = map read (words input)
    let lists = map (\x -> [1..x]) numbers
    let concatenated = concatList lists
    putStrLn "Lista original:"
    print lists
    putStrLn "Lista concatenada:"
    print concatenated
