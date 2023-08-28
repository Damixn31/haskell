-- Ejercicio 3: Crea una función esVocal que determine si un carácter dado es una vocal (minúscula o mayúscula).

thisVocal :: Char -> Bool
thisVocal c = c `elem` "aeiouAEIOU"

main :: IO ()
main = do
    putStrLn "Ingrese un caracter entre comillas simples ej -> 'b':"
    input <- getLine
    let letter = read input :: Char 
    let result = thisVocal letter
    putStrLn $ if result then "Es una vocal" else "No es una vocal"

