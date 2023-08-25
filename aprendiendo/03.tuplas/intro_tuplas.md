### Tuplas

- En Haskell, una tupla es una estructura de datos que puede contener varios elementos de diferentes tipos. A diferencia de las listas, las tuplas tienen una longitud fija y los elementos pueden ser de diferentes tipos. Las tuplas se crean agrupando valores entre paréntesis y separándolos por comas. Aquí tienes algunos ejemplos para entender mejor:

## Tupla de dos elementos:

```Haskell
-- Una tupla que contiene un entero y una cadena
miTupla :: (Int, String)
miTupla = (42, "Hola")

-- Accediendo a los elementos de la tupla
primerElemento = fst miTupla -- Devuelve 42
segundoElemento = snd miTupla -- Devuelve "Hola"

```
## Tupla de tres elementos:

```Haskell
-- Una tupla que contiene un entero, un booleano y un carácter
otraTupla :: (Int, Bool, Char)
otraTupla = (10, True, 'A')

-- Accediendo a los elementos de la tupla
primerElemento' = fst3 otraTupla -- Función personalizada para obtener el primer elemento
segundoElemento' = snd3 otraTupla -- Función personalizada para obtener el segundo elemento

-- Definición de las funciones personalizadas
fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

snd3 :: (a, b, c) -> b
snd3 (_, y, _) = y

```
# Nota: Recuerda que las tuplas en Haskell son tipos de datos diferentes según su longitud y los tipos de sus elementos. Las tuplas de diferentes longitudes y tipos son consideradas tipos diferentes.

- Las tuplas son muy útiles para agrupar datos que están relacionados pero no forman una estructura de datos más compleja, como una lista o un registro. Sin embargo, debido a su naturaleza estática en términos de longitud y tipos, es importante usarlas cuando la cantidad y tipos de elementos son conocidos y fijos.
