-- Listas 

En Haskell, las listas son un homogéneo estructura de datos. Almacena varios elementos del mismo tipo. Eso significa que podemos tener una lista de enteros o una lista de caracteres, pero no podemos tener una lista que tenga algunos enteros y luego algunos caracteres.

Nota: Podemos usar el let palabra clave para definir un nombre correcto en GHCI. Haciendo let one = 1 dentro de GHCI es el equivalente a escribir a = 1 en un script y luego cargándolo.

ghci> let lostNumbers = [4,8,15,16,23,42]  
ghci> lostNumbers  
[4,8,15,16,23,42]

Nota: [ ], [ [ ] ] y[ [ ], [ ], [ ] ] son todas cosas diferentes. La primera es una lista vacía, la segunda es una lista que contiene una lista vacía, la tercera es una lista que contiene tres listas vacías.

 Para obtener el indice de un elemento vamos a usar el !!, los indices comienzan en 0

 ghci> "Steve Buscemi" !! 6  
 'B'  
 ghci> [9.4,33.2,96.2,11.2,23.25] !! 1  
 33.2

 Las listas se pueden comparar si se pueden comparar las cosas que contienen. Cuando usas <, < =, > y > = para comparar listas, se comparan en orden lexicográfico. Primero se comparan las cabezas. Si son iguales, se comparan los segundos elementos, etc.

 ghci > [3,2,1] > [2,1,0]  
 True  
 ghci > [3,2,1] > [2,10,100]  
 True  
 ghci > [3,4,2] > [3,4]  
 True  
 ghci > [3,4,2] > [2,4]  
 True  
 ghci > [3,4,2] = = [3,4,2]  
 True  

¿Qué más puedes hacer con las listas? Aquí hay algunas funciones básicas que operan en las listas.

 head -> toma una lista y devuelve la cabezara 
 ghci > head [5,4,3,2,1]  
 5   

 tail -> toma una lista y devuelve toda la lista pero sin la cabezara
 ghci > tail [5,4,3,2,1]  
 [4,3,2,1]

 last -> toma una lista devuelve el ultimo elemento
 ghci > last [5,4,3,2,1]  
 1

 init -> toma una lista deuelve todo menos el ultimo elemento
 ghci > init [5,4,3,2,1]  
 [5,4,3,2]

 length -> toma una lusta y devuelve el longitud
 ghci > longitud [5,4,3,2,1]  
 5

 null -> comprueba si una lista esta vacia. Si es asi, devuelve True, de lo contrario False.

 ghci > nulo [1,2,3]  
 False  
 ghci > nulo [ ]  
 True 

 reverse -> invierte una lista
 ghci > reverse [5,4,3,2,1]
 [1,2,3,4,5]
 
 take -> le das un numero de una lista y extrae todos los elementos del comienzo de la lista

 ghci > take 3 [5,4,3,2,1]  
 [5,4,3]  
 ghci > take 1 [3,9,3]  
 [3]  
 ghci > take 5 [1,2]  
 [1,2]  
 ghci > take 0 [6,6,6]  
 [ ]

 Nota: Vea cómo si intentamos take más elementos de los que hay en la lista, simplemente devuelve la lista. Si intentamos tomar 0 elementos, obtenemos una lista vacía.
 
 drop -> funciona de manera similar, solo que reduce el numero de elementos desde el comienzo de una lista

 ghci > drop 3 [8,4,2,1,5,6]  
[1,5,6]  
ghci > drop 0 [1,2,3,4]  
[1,2,3,4]  
ghci > drop 100 [1,2,3,4]  
[ ]

maximum -> toma una lista de cosas que se pueden poner en algun tipo de orden y devuelve el elemento mas imporante

minimum -> devuelve el mas pequeño 

ghci> minimum [8,4,2,1,5,6]  
1  
ghci> maximum [1,9,2,3,4]  
9

sum -> toma una lista de numeros y devuelve la suma

product -> toma una lista de numeros y devuelve su producto

ghci > suma [5,2,1,6,3,2,5,7]  
31  
ghci > producto [6,2,1,2]  
24  
ghci > producto [1,2,5,6,7,9,2,0]  
0

elem -> toma una cosa y una lista de cosas y nos dice si esa cosa es un elemento de la lista. Por lo general, se llama función de infijo porque es más fácil de leer de esa manera.

ghci> 4 `elem` [3,4,5,6]  
True  
ghci> 10 `elem` [3,4,5,6]  
False  

---------------------------------------------------------------------------------
range texas

Para hacer una lista que contenga todos los números naturales del 1 al 20, simplemente escriba [ 1..20 ]. Eso es el equivalente de escribir [ 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ] y no hay diferencia entre escribir uno u otro, excepto que escribir secuencias de enumeración largas manualmente es estúpido.

ghci > [1..20]  
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,dieciséis,17,18,19,20]  
ghci > ['una'..'z']  
"abcdefghijklmnopqrstuvwxyz"  
ghci > ['K'..'Z']  
"KLMNOPQRSTUVWXYZ"

-----------------------------------------------------------------------------------

cycle -> toma una lista y la divide en una lista infinita. Si solo intenta mostrar el resultado, continuará para siempre, por lo que debe cortarlo en algún lugar.

ghci> take 10 (cycle [1,2,3])  
[1,2,3,1,2,3,1,2,3,1]  
ghci> take 12 (cycle "LOL ")  
"LOL LOL LOL "

repeat -> toma un elemento y produce una lista infinita de solo ese elemento. Es como andar en bicicleta una lista con solo un elemento.

ghci> take 10 (repeat 5)  
[5,5,5,5,5,5,5,5,5,5]
