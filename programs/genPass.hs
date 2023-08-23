-- Generador de contraseñas

import System.Random
import Data.Char
import System.Console.ANSI

listNum :: [Int]
listNum = [0..9]


listChar :: [Char]
listChar = ['!', '@', '#', '$', '%', '^', '&', '*']

listLetters :: [Char]
listLetters = ['a'..'z']

upperCaseLetters :: [Char]
upperCaseLetters = map toUpper listLetters

combinedChar :: [Char]
combinedChar = map intToDigit listNum ++ listChar ++ listLetters ++ upperCaseLetters

-- genera un elemento aleatorio de una lista
randomElement :: [a] -> IO a 
randomElement xs = do
    index <- randomRIO(0, length xs - 1)
    return (xs !! index)

-- Genera una password aleatorio
generateRandomPassword :: Int -> IO String
generateRandomPassword lengthPwd = do
    passwordChars <- mapM (\_ -> randomElement combinedChar) [1..lengthPwd]
    return passwordChars


colorPrint :: String -> Color -> IO ()
colorPrint text textColor = do
    setSGR [SetColor Foreground Vivid textColor]
    putStrLn text
    setSGR [Reset]

main :: IO ()
main = do
    randomPassword <- generateRandomPassword 12 
    colorPrint randomPassword Magenta
