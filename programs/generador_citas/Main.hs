import System.Random (randomRIO)
import Quotes

getRandomQuote :: IO Quote
getRandomQuote = do
    randomIndex <- randomRIO (0, length quotes - 1)
    return (quotes !! randomIndex)

main :: IO ()
main = do
    putStrLn "Generador de citas:"
    putStrLn "--------------------------------"
    
    randomQuote <- getRandomQuote
    putStrLn $ "Cita: " ++ text randomQuote
    putStrLn $ "Autor: " ++ autor randomQuote


