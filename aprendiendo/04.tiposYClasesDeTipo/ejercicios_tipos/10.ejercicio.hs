-- Ejercicio 10: Define una función aplicarDosVeces que tome una función y un valor, y aplique la función dos veces al valor.

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = do
    putStrLn "Ingresa un numero:"
    input <- getLine
    let number = read input :: Int
    let result = applyTwice (*2) number
    putStrLn $ "Resultado despues de aplicar dos veces (*2): " ++ show result
