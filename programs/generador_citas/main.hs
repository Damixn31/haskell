import System.Random (randomRIO)
import Quotes (Quote, quotes)

getRandomQuote :: IO Quote
getRandomQuote = do
    randomIndex <- RandomRIO (0, lenght quotes - 1)
    return (quotes !! randomIndex)

main :: IO ()
main = do
    putStrLn "Generador de citas:"
    putStrLn "--------------------------------"
    
    randomQuote <- getRandomQuote
    putStrLn $ "Cita: " ++ text randomQuote
    putStrLn $ "Autor: " ++ autor randomQuote
