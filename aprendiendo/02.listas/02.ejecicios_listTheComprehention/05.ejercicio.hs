-- Dada una lista de palabras, convierte cada palabra en su versión en mayúsculas.
import Data.Char (toUpper)

wordsLists :: [String] -> [String]
wordsLists words = [map toUpper word | word <- words]

main :: IO ()
main = do
    putStrLn "Ingrese palabras separadas por un espacio:"
    input <- getLine
    let letters = words input
    let listMayus = wordsLists letters
    putStrLn "Lista original:"
    print letters  -- tambien puedo usar mapM_ putStrLn letters -> lo que hace es imprimir una debajo de otro
    putStrLn "Lista de palabras en Mayuscula:"
    print listMayus
