-- Dada una lista de cadenas, crea una nueva lista que contenga las longitudes de las cadenas. 
listsString :: [String] -> [Int]
listsString strings = [length str | str <- strings]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de cadenas separados de espacios:"
    input <- getLine
    let list = words input 
    let strLong = listsString list
    putStrLn "Lista original:"
    print list
    putStrLn "longitud de la palabra de la lista:"
    print strLong

