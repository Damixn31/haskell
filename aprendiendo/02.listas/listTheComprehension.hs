-- Lista de compresion
Una comprensión básica para un conjunto que contiene los primeros diez números naturales pares es notación establecida. La parte antes de que la tubería se llame función de salida, X es la variable, N es el conjunto de entrada y x < = 10 es el predicado. Eso significa que el conjunto contiene los dobles de todos los números naturales que satisfacen el predicado.

Si quisiéramos escribir eso en Haskell, podríamos hacer algo como tomar 10 [ 2,4 .. ]. Pero, ¿qué pasaría si no quisiéramos dobles de los primeros 10 números naturales pero algún tipo de función más compleja aplicada en ellos? Podríamos usar una comprensión de lista para eso. Las comprensiones de la lista son muy similares a las comprensiones establecidas. Seguiremos obteniendo los primeros 10 números pares por ahora. La comprensión de la lista que podríamos usar es [ x * 2 | x < - [ 1..10 ] ]. X se extrae de [ 1..10 ] y para cada elemento en [ 1..10 ] ( al que nos hemos unido X), obtenemos ese elemento, solo se duplicó. Aquí está esa comprensión en acción.

ghci > [x*2 | x <- [1..10]]  
[2,4,6,8,10,12,14,16,18,20]  

Como puede ver, obtenemos los resultados deseados. Ahora agreguemos una condición ( o un predicado ) a esa comprensión. Los predicados van tras las partes de unión y están separados de ellos por una coma. Digamos que solo queremos los elementos que, duplicados, son mayores o iguales a 12.

ghci > [x*2 | x <- [1..10], x*2 >= 12]  
[12,14,16,18,20]

Genial, funciona. ¿Qué tal si quisiéramos todos los números del 50 al 100 cuyo resto cuando se divide con el número 7 es 3?.
mod -> es una función que se utiliza para calcular el residuo de la división entera entre dos números. La función toma dos argumentos: el dividendo y el divisor, y devuelve el residuo como resultado.

ghci > [x | x <- [50..100], x `mod`7 == 3]   
[52,59,66,73,80,87,94]
--------------------------------------------------------------------------------------------------------------------------

Tener en cuenta que eliminar listas por predicados también se llama filtrado. Tomamos una lista de números y los filtramos por el predicado. Ahora por otro ejemplo. Digamos que queremos una comprensión que reemplace cada número impar mayor que 10 con "BANG!" y cada número impar que es menor que 10 con "BOOM!". Si un número no es extraño, lo tiramos de nuestra lista. Por conveniencia, pondremos esa comprensión dentro de una función para que podamos reutilizarla fácilmente.
odd -> es una función en Haskell que se utiliza para verificar si un número entero es impar. Devuelve True si el número es impar y False si el número es par.

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

ghci> boomBangs [7..13]  
["BOOM!","BOOM!","BANG!","BANG!"]

Podemos incluir varios predicados. Si quisiéramos todos los números del 10 al 20 que no sean 13, 15 o 19, haríamos:

ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
[10,11,12,14,16,17,18,20]  

No solo podemos tener múltiples predicados en las comprensiones de la lista (, sino que un elemento debe satisfacer todos los predicados que se incluirán en la lista resultante ), también podemos extraer de varias listas. Al extraer de varias listas, las comprensiones producen todas las combinaciones de las listas dadas y luego se unen a ellas por la función de salida que suministramos. Una lista producida por una comprensión que se basa en dos listas de longitud 4 tendrá una longitud de 16, siempre que no las filtremos. Si tenemos dos listas, [ 2,5,10 ] y [ 8,10,11 ] y queremos obtener los productos de todas las combinaciones posibles entre números en esas listas, esto es lo que haríamos.

ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]  
[16,20,22,40,50,55,80,100,110]

Como se esperaba, la longitud de la nueva lista es 9. ¿Qué pasaría si quisiéramos todos los productos posibles que sean más de 50?

ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]  
[55,80,100,110]

¿Qué tal una comprensión de la lista que combina una lista de adjetivos y una lista de sustantivos ... para la hilaridad épica.

ghci> let nouns = ["hobo","frog","pope"]  
ghci> let adjectives = ["lazy","grouchy","scheming"]  
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
"grouchy pope","scheming hobo","scheming frog","scheming pope"]

¡Lo sé! Escribamos nuestra propia versión de length! Lo llamaremos length'.

length' xs = sum [1 | _ <- xs]

_ significa que no nos importa lo que sacaremos de la lista de todos modos, así que en lugar de escribir un nombre variable que nunca usaremos, solo escribimos _. Esta función reemplaza cada elemento de una lista con 1 y luego lo resume todo. Esto significa que la suma resultante será la longitud de nuestra lista.

Solo un recordatorio amigable: debido a que las cadenas son listas, podemos usar las comprensiones de listas para procesar y producir cadenas. Aquí hay una función que toma una cadena y elimina todo, excepto las letras mayúsculas.

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

ghci> removeNonUppercase "Hahaha! Ahahaha!"  
"HA"  
ghci> removeNonUppercase "IdontLIKEFROGS"  
"ILIKEFROGS"

El predicado aquí hace todo el trabajo. Dice que el personaje se incluirá en la nueva lista solo si es un elemento de la lista [ 'A'..'Z']. Las comprensiones de listas anidadas también son posibles si está operando en listas que contienen listas. Una lista contiene varias listas de números. Eliminemos todos los números impares sin aplanar la lista.
even -> es una función que se utiliza para verificar si un número entero es par. La función devuelve True si el número es par y False si el número es impar.

ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
ghci> [ [ x | x <- xs, even x ] | xs <- xxs]  
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]  

Puede escribir interpretaciones de listas en varias líneas. Entonces, si no está en GHCI, es mejor dividir las comprensiones de listas más largas en varias líneas, especialmente si están anidadas.







