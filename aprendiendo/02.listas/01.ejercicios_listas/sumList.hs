-- defino una funcion 
sumList :: Num a => [a] -> a
sumList = foldl (+) 0

-- creo una lista de numero
listNumber :: [Int]
listNumber = [1,2,3,4,5,6,7,8,9,10]

-- llamo a la funcion sumList con listNumber como argumento
result :: Int
result = sumList listNumber

-- Imprimo el resultado
main :: IO ()
main = putStrLn $ "Suma de la lista es: " ++ show result



