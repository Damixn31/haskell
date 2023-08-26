-- Ejercicio 1: Define una función esPar que tome un número entero como entrada y devuelva True si es par, y False en caso contrario.
thisPar :: Int -> Bool
thisPar n = n `mod` 2 == 0

main :: IO ()
main = do
    putStrLn "Ingrese un nuemero entero:"
    input <- getLine
    let numPar = read input :: Int
    let result = thisPar numPar
    putStrLn $ if result then "Es par" else "No es par"


