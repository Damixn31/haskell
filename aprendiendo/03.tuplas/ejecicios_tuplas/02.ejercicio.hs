-- Ejercicio 2: Escribe una función que tome una lista de nombres y edades, y devuelva una lista de nombres de personas que son mayores de edad (mayores de 18 años).
listNameAge :: [(String, Int)] -> [String]
listNameAge moreAge = [name | (name, age) <- moreAge, age >= 18]

main :: IO ()
main = do
    putStrLn "Escribe una lista de nombre y edades ejemplo -> [('nombre1', edad1), ('nombre2', edad2), ...] "
    input <- getLine
    let nameMoreAge = read input :: [(String, Int)]
    let result = listNameAge nameMoreAge   
    putStrLn "Lo nombres de las personas mayores son:"
    print result
