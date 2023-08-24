-- Crea una funcion que devuelva la lista inversa de la entrada.

listNumber :: [Int]
listNumber = [1,2,3,4,5,6,7,8,9,10]

listReverse :: [Int]
listReverse = reverse listNumber

main :: IO ()
main = putStrLn $ "Lista inversa: " ++ show listReverse
