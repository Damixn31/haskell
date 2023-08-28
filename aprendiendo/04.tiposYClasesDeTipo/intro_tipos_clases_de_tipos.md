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
- Los parametros estan separados por -> y no hay una distincion espacial entre los parametros y el tipo de retorno. el tipo de retorno es el ultimo elemento de la declaracion y los parametros son los tres fsts. Mas adelante veremos porque todos estan separados con -> en lugar de tener una distincion mas explicita entre los tipos de retorno y los parametros similares.
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
- Vemos eso fst toma una tupla que contiene dos tipos y devuelve un elemento que es del mismo tipo que el primer componente del par. Es por eso que podemos usar fst en un par que contiene dos tipos. Tenga en cuenta que solo porque a y b son variables de tipo diferentes, no tienen que ser de tipos diferentes. Simplemente establece que el tipo del primer componente y el tipo del valor de retorno son los mismos.

# Clases de tipo 101

- Una clase de tipo es un tipo de interfaz que define algún comportamiento. Si un tipo es parte de una clase de tipo, eso significa que admite e implementa el comportamiento que describe la clase de tipo. Muchas personas que vienen de OOP se confunden con las clases de tipo porque piensan que son como clases en lenguajes orientados a objetos. Bueno, no lo son. Puedes pensar en ellos como interfaces Java, solo que mejor.

- ¿Cuál es la firma de tipo de == función?

```Haskell
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool
```
### Nota: 
- el operador de igualdad, == es una función. Así son +, *, -, / y casi todos los operadores. Si una función está compuesta solo por caracteres especiales, se considera una función de infijo de forma predeterminada. Si queremos examinar su tipo, pasarlo a otra función o llamarlo como una función de prefijo, tenemos que rodearlo entre paréntesis.

- Interesante. Vemos algo nuevo aquí, el = > símbolo. Todo antes del = > símbolo se llama restricción de clase. Podemos read la declaración de tipo anterior como esta: la función de igualdad toma dos valores que son del mismo tipo y devuelve un Bool. El tipo de esos dos valores debe ser miembro de la Eq clase ( esta fue la restricción de clase ).

- los Eq typeclass proporciona una interfaz para probar la igualdad. Cualquier tipo en el que tenga sentido evaluar la igualdad entre dos valores de ese tipo debe ser miembro de Eq clase. Todos los tipos estándar de Haskell, excepto IO (, el tipo para tratar la entrada y salida ) y las funciones son parte de Eq clase de tipo.

- los elem la función tiene un tipo de (Eq a) => a -> [a] -> Bool porque usa == sobre una lista para verificar si hay algún valor que estamos buscando.

## Algunas clases de tipo básicas:

# Eq 
- se utiliza para tipos que apoyan las pruebas de igualdad. Las funciones que implementan sus miembros son == y /=. Entonces si hay un Eq restricción de clase para una variable de tipo en una función, utiliza = = o /= en algún lugar dentro de su definición. Todos los tipos que mencionamos anteriormente, excepto las funciones, son parte de Eq, para que puedan ser probados por la igualdad.

```Haskell
ghci> 5 == 5  
True  
ghci> 5 /= 5  
False  
ghci> 'a' == 'a'  
True  
ghci> "Ho Ho" == "Ho Ho"  
True  
ghci> 3.432 == 3.432  
True
```
# Ord 
- es para tipos que tienen un pedido.

```Haskell
ghci> :t (>)  
(>) :: (Ord a) => a -> a -> Bool
```

- Todos los tipos que cubrimos hasta ahora, excepto las funciones, son parte de Ord. Ord cubre todas las funciones de comparación estándar, como >, <, >= y <=. los comparar la función toma dos Ord miembros del mismo tipo y devuelve un pedido. Pedido es un tipo que puede ser GT, LT o EQ, significado mayor que, menor que y igual, respectivamente.
- Ser miembro de Ord, un tipo primero debe tener membresía en el prestigioso y exclusivo Eq club.

```Haskell
ghci> "Abrakadabra" < "Zebra"  
True  
ghci> "Abrakadabra" `compare` "Zebra"  
LT  
ghci> 5 >= 2  
True  
ghci> 5 `compare` 3  
GT
```

- Miembros de show puede presentarse como cadenas. Todos los tipos cubiertos hasta ahora, excepto las funciones, son parte de Mostrar. La función más utilizada que se ocupa de Mostrar tipo clase es show. Toma un valor cuyo tipo es miembro de Mostrar y nos lo presenta como una cuerda.

```Haskell
ghci> show 3  
"3"  
ghci> show 5.334  
"5.334"  
ghci> show True  
"True"
```
# Read 
- es una especie de clase opuesta de show. los read la función toma una cadena y devuelve un tipo que es miembro de read.

```Haskell
ghci> read "True" || False  
True  
ghci> read "8.2" + 3.8  
12.0  
ghci> read "5" - 2  
3  
ghci> read "[1,2,3,4]" ++ [3]  
[1,2,3,4,3]
```

- Hasta ahora todo bien. Nuevamente, todos los tipos cubiertos hasta ahora están en esta clase de tipo. Pero, ¿qué pasa si tratamos de hacer solo read "4"?

```Haskell
ghci> read "4"  
<interactive>:1:0:  
    Ambiguous type variable `a' in the constraint:  
      `Read a' arising from a use of `read' at <interactive>:1:0-7  
    Probable fix: add a type signature that fixes these type variable(s)  

```
- Lo que GHCI nos dice aquí es que no sabe lo que queremos a cambio. Observe que en los usos anteriores de read hicimos algo con el resultado después. De esa manera, GHCI podría inferir qué tipo de resultado queríamos de nuestro read. Si lo usamos como booleano, sabía que tenía que devolver un Bool. Pero ahora, sabe que queremos algún tipo que sea parte de read clase, simplemente no sabe cuál. Echemos un vistazo a la firma tipo de read.

```Haskell
ghci> :t read  
read :: (Read a) => String -> a 
```

- ¿Ver? Devuelve un tipo que forma parte de read pero si no intentamos usarlo de alguna manera más tarde, no tiene forma de saber qué tipo. Es por eso que podemos usar explícito anotaciones de tipo. Las anotaciones de tipo son una forma de decir explícitamente cuál debería ser el tipo de expresión. Hacemos eso agregando :: al final de la expresión y luego especificando un tipo. Observar:

```Haskell
ghci> read "5" :: Int  
5  
ghci> read "5" :: Float  
5.0  
ghci> (read "5" :: Float) * 4  
20.0  
ghci> read "[1,2,3,4]" :: [Int]  
[1,2,3,4]  
ghci> read "(3, 'a')" :: (Int, Char)  
(3, 'a')
```

- La mayoría de las expresiones son tales que el compilador puede inferir cuál es su tipo por sí mismo. Pero a veces, el compilador no sabe si devolver un valor de tipo Int o Float para una expresión como read "5". Para ver cuál es el tipo, Haskell tendría que evaluar realmente read "5". Pero dado que Haskell es un lenguaje con tipo estático, tiene que conocer todos los tipos antes de que se compile el código ( o en el caso de GHCI, evaluado ). Entonces tenemos que decirle a Haskell: "¡Oye, esta expresión debería tener este tipo, en caso de que no lo sepas!".

# Enum

- los miembros son tipos ordenados secuencialmente — que se pueden enumerar. La principal ventaja de la Enum typeclass es que podemos usar sus tipos en rangos de lista. También tienen sucesores y predecesores definidos, que puede obtener con el succ y pred funciones. Tipos en esta clase: (), Bool, Char, Ordering, Int, Integer, Float y Double.

```Haskell
ghci> ['a'..'e']  
"abcde"  
ghci> [LT .. GT]  
[LT,EQ,GT]  
ghci> [3 .. 5]  
[3,4,5]  
ghci> succ 'B'  
'C'
```

# Bounded
- los miembros tienen un límite superior e inferior.

```Haskell
ghci> minBound :: Int  
-2147483648  
ghci> maxBound :: Char  
'\1114111'  
ghci> maxBound :: Bool  
True  
ghci> minBound :: Bool  
False
```

- minBound y maxBound son interesante porque tienenun tipo de (Bounded a) => a. En cierto sentidos, son constantes polimórficas. 
- todas las tuplas tambien son pardes de Bounded si los compoentes tambien estan en el.

```Haskell
ghci > maxBound :: (Bool, Int, Char)  
(Verdadero,2147483647,'\1114111')
```
# Num 
- Es un tipo de clase numerico. Sus miembros tiene la propiedad de poder actuar como numeros. Examininamos el tipo de numero.

```Haskell
ghci> :t 20  
20 :: (Num t) => t
```

- Parace que tambien los numero enteros son constantes polimórficas. Puede actuar como caulquier tipo que sea miembro de la clase Num

```Haskell
ghci> 20 :: Int  
20  
ghci> 20 :: Integer  
20  
ghci> 20 :: Float  
20.0  
ghci> 20 :: Double  
20.0
```
- Estos son tipos que estan en Num, Si examinamos el tipo de *, vemos que acepta todos los numeros

```Haskell
ghci> :t (*)  
(*) :: (Num a) => a -> a -> a
```

- Tomamos dos numeros del mismo tipo y devuelve un numero de este tipo. Es por eso (5 :: Int) * (6 :: Integer) dara como resultado un error. 5 * (6 :: Integer) funcionara bien y producira un Integer porque 5 puede actuar como un Integer o un Int
- Unir Num, ya debe ser amigo de Show y Eq

# Integral
- También es una clase de tipo numérico. Num incluye todos los números, incluidos los números reales y los números integrales, Integral incluye solo números integrales ( enteros ). En esta clase de tipo están Int y Integer.

# Floating
- incluye solo números de coma flotante, por lo que Float y Double.

- Una función muy útil para tratar números es de integral. Tiene una declaración de tipo de fromIntegral :: ( Num b, Integral a ) => a -> b. Desde su firma de tipo, vemos que toma un número integral y lo convierte en un número más general. Eso es útil cuando desea que los tipos integrales y de coma flotante trabajen juntos muy bien. Por ejemplo, el longitud la función tiene una declaración de tipo de longitud :: [a] -> Int en lugar de tener un tipo más general de (Num b) => longitud :: [a] -> b. Creo que está ahí por razones históricas o algo así, aunque en mi opinión, es bastante estúpido. De todos modos, si tratamos de obtener una longitud de una lista y luego agregarla a 3.2, obtendremos un error porque intentamos sumar un Int y un número de coma flotante. Entonces, para evitar esto, lo hacemos de longitud integral ([1,2,3,4]) + 3.2 y todo funciona.

- Observe que de integral tiene varias restricciones de clase en su firma de tipo. Eso es completamente válido y, como puede ver, las restricciones de clase están separadas por comas dentro de los paréntesis.
