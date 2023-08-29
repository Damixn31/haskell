-- Ejercicio 5: Implementa una función filtrarMayores que tome un número y una lista de números, y devuelva una lista con los elementos mayores que el número dado.

filterGreater :: Int -> [Int] -> [Int]
filterGreater n = filter (> n)

main :: IO ()
main = do
    putStrLn "Ingrese un numero:"
    inputNumber <- getLine
    let number = read inputNumber :: Int

    putStrLn "Ingrese una lista de numeros separados por espacios:"
    inputList <- getLine
    let numbers = map read (words inputList) :: [Int]

    let result = filterGreater number numbers
    putStrLn $ "Elementos mayores a " ++ show number ++ ": " ++ show result
