-- Ejercicio 7: Define una función contarElementos que cuente cuántos elementos hay en una lista.

countElement :: [a] -> Int
countElement = length 

main :: IO ()
main = do
    putStrLn "Ingrese una lista de elementos separadas de espacios:"
    input <- getLine
    let elemet = words input 
    let count = countElement elemet
    putStrLn $ "Resultado de elementos de la lista: " ++ show count
