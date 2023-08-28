-- Ejercicio 4: Define una función invertirLista que invierta el orden de los elementos en una lista.

invertirLista :: [a] -> [a]
invertirLista = reverse

main :: IO ()
main = do
    putStrLn "Ingrese una lista []:"
    input <- getLine
    let list = words input 
    let result  = invertirLista list 
    putStrLn $ unwords result
