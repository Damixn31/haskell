### Tipos y Tipos de clases

- Anteriormente mencionamos que Haskell tiene un sistema de tipo estático. El tipo de cada expresión se conoce en el momento de la compilación, lo que conduce a un código más seguro. Si escribe un programa en el que intenta dividir un tipo booleano con algún número, ni siquiera se compilará. Eso es bueno porque es mejor detectar tales errores en el momento de la compilación en lugar de que su programa se bloquee. Todo en Haskell tiene un tipo, por lo que el compilador puede razonar bastante sobre su programa antes de compilarlo.

A diferencia de Java o Pascal, Haskell tiene inferencia de tipo. Si escribimos un número, no tenemos que decirle a Haskell que es un número. Puede inferir eso por sí solo, por lo que no tenemos que escribir explícitamente los tipos de nuestras funciones y expresiones para hacer las cosas. Cubrimos algunos de los conceptos básicos de Haskell con solo una mirada muy superficial a los tipos. Sin embargo, comprender el sistema de tipos es una parte muy importante del aprendizaje de Haskell.

```Haskell
ghci> :t 'a'  
'a' :: Char  
ghci> :t True  
True :: Bool  
ghci> :t "HELLO!"  
"HELLO!" :: [Char]  
ghci> :t (True, 'a')  
(True, 'a') :: (Bool, Char)  
ghci> :t 4 == 5  
4 == 5 :: Bool
```

- Aquí vemos eso haciendo :t en una expresión imprime la expresión seguida de :: y su tipo. :: se lee como "tiene tipo de". Los tipos explícitos siempre se denotan con la primera letra en mayúscula. 'a', como parece, tiene un tipo de Char. No es difícil concluir que significa personaje. True es de un Bool tipo. Eso tiene sentido. ¿Pero que es esto? Examinando el tipo de "HOLA!" produce un [ String ]. Los corchetes denotan una lista. Entonces lo leemos tal como está una lista de personajes. A diferencia de las listas, cada longitud de tupla tiene su propio tipo. Entonces la expresión de ( True, 'a' ) tiene un tipo de ( Bool, Char ), mientras que una expresión como ( 'a', 'b', 'c' ) tendría el tipo de ( Char, Char, Char ). 4 = = 5 siempre volverá False, entonces su tipo es Bool.
- Las funciones también tienen tipos. Al escribir nuestras propias funciones, podemos elegir darles una declaración de tipo explícita. Esto generalmente se considera una buena práctica, excepto cuando se escriben funciones muy cortas. A partir de ahora, daremos todas las funciones que hacemos declaraciones de tipo. ¿Recuerdas la comprensión de la lista que hicimos anteriormente que filtra una cadena para que solo queden tapas? Así es como se ve con una declaración de tipo.

```Haskell
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```
- removeNonUppercase tiene un tipo de [Char] -> [Char], lo que se significa que se asignara de un String a un String. Esto se debe a que toma una cadena como parametro y devuelve otra como resultado. Los tipos [Char] son sinonimos de String entonces es mas claro si escribimos removeNonUppercase :: String -> String. No tuvimos que darle a esa funcion declaracion de tipo porque el compilador puede inferir por si mismo que es una funcion de un String a un String, pero lo hicimos de todos modos. Pero Como escribimos el tipo de funcion que toma varios parametros? esta es una funcion simple que toma tres enteros y los agrega:

```Haskell
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  
```
- Los parametros estan separados por -> y no hay una distincion espacial entre los parametros y el tipo de retorno. el tipo de retorno es el ultimo elemento de la declaracion y los parametros son los tres primeros. Mas adelante veremos porque todos estan separados con -> en lugar de tener una distincion mas explicita entre los tipos de retorno y los parametros similares.
- Si deseas dar a una funcion una declaracion de tipo pero no estas seguro de que deberia ser, siempre puedes escribir una una funcion sin ella y luego verificarla :t. Las funciones tambien son expresiones, asi que :t trabaja en ello sin problemas

# descripcion general de algunos tipos comunes:

- Int significa entero, se usa para numeros enteros 7 puede ser Int pero 7.2 no se puede. Int esta limitado, lo que significa que tiene un valor minimo y maximo. Por lo general en maquinas de 32 Bits el maximo posble Int es 2147483647 y el minimo es -2147483648

- Integer significa, tambien entero. la principal diferencia es que no esta delimitado, por lo que puede usarse represar numero grandes, Int sin embargo es mas eficiente.

```Haskell
factorial :: Integer -> Integer  
factorial n = product [1..n]
```

```Haskell
ghci> factorial 50  
30414093201713378043612608166064768844377641568960512000000000000  
```
Float es un flotante real con una sola precision 

```Haskell
circumference :: Float -> Float  
circumference r = 2 * pi * r
```
```Haskell
ghci> circumference 4.0  
25.132742
```
- Bool es un tipo booleano, tiene solo dos falores True o False

- Char representar un caracter se pone con comillas simples. Una lista de caracteres es un String

- Las tuplas son tipos pero dependen de su longitud y de los tipos de sus componentes, por lo que en teoria, hay un numero infinito de tipos de tuplas. las tuplas vacias () tambien es un tipo que solo puede tener un solo valor.

```Haskell
ghci> :t head  
head :: [a] -> a  
```
- Hmmm! Que es esto a? ¿Es un tipo? Recuerde que anteriormente declaramos que los tipos están escritos en mayúsculas, por lo que no puede ser exactamente un tipo. Porque no está en mayúscula, en realidad es un tipo variable. Eso significa que un puede ser de cualquier tipo. Esto es muy parecido a los genéricos en otros idiomas, solo en Haskell es mucho más poderoso porque nos permite escribir fácilmente funciones muy generales si no usan ningún comportamiento específico de los tipos en ellas. Se llaman las funciones que tienen variables de tipo funciones polimórficas. La declaración de tipo de cabeza establece que toma una lista de cualquier tipo y devuelve un elemento de ese tipo.

- Aunque las variables de tipo pueden tener nombres de más de un carácter, generalmente les damos nombres de a, b, c, d …

- Recuerda fst? Devuelve el primer componente de un par. Examinemos su tipo.

```Haskell
ghci> :t fst  
fst :: (a, b) -> a  
```




