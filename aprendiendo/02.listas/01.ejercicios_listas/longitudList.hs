-- implementa una funcion que calcule la longitud de  una lista

-- creo lista de numeros
listNumber :: [Int]
listNumber = [1,2,3,4,5,6,7,8,9,10]

-- Defino funcion para calcular la longitud de la lista
longitud :: Int
longitud = length listNumber

-- Imprimo el resultado
main :: IO ()
main = putStrLn $ "La longitud de la lista es: " ++ show longitud

