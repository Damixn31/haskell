 -- Dada una lista de palabras, filtra las palabras que tienen más de 5 letras.
 
filterWordsMoreFive :: [String] -> [String]
filterWordsMoreFive words = [word | word <- words, length word > 5]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de palabras separados por escapacio: "
    input <- getLine
    let letters = words input
    let moreFive = filterWordsMoreFive letters
    putStrLn "Lista original: "
    print letters
    putStrLn "Lista de palabras mayor a 5 letras: "
    print moreFive
