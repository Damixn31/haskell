# Generador de Contraseñas Aleatorias en Haskell

Este es un generador de contraseñas aleatorias escrito en Haskell. Genera contraseñas combinando números, letras (mayúsculas y minúsculas) y caracteres especiales.

## Uso

1. Asegúrate de tener Haskell instalado en tu sistema.
2. Clona este repositorio: `git clone https://github.com/Damixn31/haskell.git`
3. Navega al directorio del proyecto: `cd tu-repositorio`
4. Compila: `ghc -dynamic genPass.hs`
5. Ejecuta: `genPass`
6. Se generará una contraseña aleatoria y se mostrará en la consola.

## Código

El código está dividido en las siguientes partes:

- `listNum`: Lista de números del 0 al 9.
- `listLetters`: Lista de letras minúsculas del alfabeto.
- `listChar`: Lista de caracteres especiales.
- `uppercaseLetters`: Lista de letras mayúsculas.
- `combinedChar`: Lista combinada de números, letras (mayúsculas y minúsculas) y caracteres especiales.
- `randomElement`: Función que elige un elemento aleatorio de una lista dada.
- `generateRandomPassword`: Función para generar una contraseña aleatoria de una longitud especificada.
- `colorPrint`: Función para imprimir texto en un color específico en la consola.
- `main`: Función principal que genera una contraseña aleatoria y la muestra en la consola.

- 
