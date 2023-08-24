-- Escribe una funcion que encuentre el elemento maximo de una lista de numeros

listNumber :: [Int]
listNumber = [1,2,3,4,5,6,7,8,9,10]

-- elemento maximo
maxList :: Int
maxList = maximum listNumber

main :: IO ()
main = putStrLn $ "El numero maximo de la lista es: " ++ show maxList
