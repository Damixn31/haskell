-- Ejercicio 8: Implementa una función intercalar que tome dos listas y devuelva una lista intercalando sus elementos.

intercalar :: [a] -> [a] -> [a]
intercalar [] ys = ys
intercalar (x:xs) ys = x : intercalar ys xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista:"
    inputOne <- getLine
    let listOne = words inputOne

    putStrLn "Ingrese la segunda lista:"
    inputTwo <- getLine
    let listTwo = words inputTwo
    
    let result = intercalar listOne listTwo
    putStrLn $ "la lista intercalada: " ++ show result
