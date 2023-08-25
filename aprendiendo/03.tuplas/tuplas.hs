-- Tuplas

De alguna manera, las tuplas son como listas —, son una forma de almacenar varios valores en un solo valor. Sin embargo, hay algunas diferencias fundamentales. Una lista de números es una lista de números. Ese es su tipo y no importa si solo tiene un número o una cantidad infinita de números. Sin embargo, las tuplas se usan cuando sabe exactamente cuántos valores desea combinar y su tipo depende de cuántos componentes tiene y los tipos de componentes. Se denotan con paréntesis y sus componentes están separados por comas.

Otra diferencia clave es que no tienen que ser homogéneos. A diferencia de una lista, una tupla puede contener una combinación de varios tipos.

Piensa en cómo representaríamos un vector bidimensional en Haskell. Una forma sería usar una lista. Eso sería un tipo de trabajo. Entonces, ¿qué pasaría si quisiéramos poner un par de vectores en una lista para representar puntos de forma en un plano bidimensional? Podríamos hacer algo como [ [ 1,2 ], [ 8,11 ], [ 4,5 ] ]. El problema con ese método es que también podríamos hacer cosas como [ [ 1,2 ], [ 8,11,5 ], [ 4,5 ] ], con lo que Haskell no tiene ningún problema ya que sigue siendo una lista de listas con números, pero no tiene sentido. Pero una tupla de tamaño dos ( también llamada par ) es su propio tipo, lo que significa que una lista no puede tener un par de pares y luego un triple ( una tupla de tamaño tres ), así que usemos eso en su lugar. En lugar de rodear los vectores con corchetes, utilizamos paréntesis: [ ( 1,2 ), ( 8,11 ), ( 4,5 ) ]. ¿Qué pasa si tratamos de hacer una forma como [ ( 1,2 ), ( 8,11,5 ), ( 4,5 ) ]? Bueno, obtendríamos este error:

Couldn't match expected type `(t, t1)'  
against inferred type `(t2, t3, t4)'  
In the expression: (8, 11, 5)  
In the expression: [(1, 2), (8, 11, 5), (4, 5)]  
In the definition of `it': it = [(1, 2), (8, 11, 5), (4, 5)]  

Nos dice que intentamos usar un par y un triple en la misma lista, lo que no se supone que suceda. Tampoco podías hacer una lista como [( 1,2 ), ("One", 2)] porque el primer elemento de la lista es un par de números y el segundo elemento es un par que consta de una cadena y un número. Las tuplas también se pueden usar para representar una amplia variedad de datos. Por ejemplo, si quisiéramos representar el nombre y la edad de alguien en Haskell, podríamos usar un triple: ( "Christopher", "Walken", 55 ). Como se ve en este ejemplo, las tuplas también pueden contener listas.

Use tuplas cuando sepa de antemano cuántos componentes debería tener alguna pieza de datos. Las tuplas son mucho más rígidas porque cada tamaño diferente de tupla es su propio tipo, para que no pueda escribir una función general para agregar un elemento a una tupla —, tendría que escribir una función para agregar a un par, una función para agregar a un triple, una función para agregar a una tupla de 4, etc.

Si bien hay listas de singleton, no existe una tupla de singleton. Realmente no tiene mucho sentido cuando lo piensas. Una tupla de un solo tono sería el valor que contiene y, como tal, no tendría ningún beneficio para nosotros.

Al igual que las listas, las tuplas se pueden comparar entre sí si se pueden comparar sus componentes. Solo que no puede comparar dos tuplas de diferentes tamaños, mientras que puede comparar dos listas de diferentes tamaños. Dos funciones útiles que funcionan en pares:

fst -> toma un par y devuelve su primer componente.

ghci> fst (8,11)  
8  
ghci> fst ("Wow", False)  
"Wow"

snd -> toma un par y devuelve su segundo componente.

ghci> snd (8,11)  
11  
ghci> snd ("Wow", False)  
False  

Nota: Estas funciones funcionan solo en pares. No trabajarán en triples, 4 tuplas, 5 tuplas, etc. Revisaremos la extracción de datos de tuplas de diferentes maneras un poco más tarde.

Una función genial que produce una lista de pares: zip. Toma dos listas y luego las divide en una lista uniendo los elementos coincidentes en pares. Es una función realmente simple pero tiene muchos usos. Es especialmente útil para cuando desea combinar dos listas de una manera o atravesar dos listas simultáneamente. Aquí hay una demostración.

ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
[(1,5),(2,5),(3,5),(4,5),(5,5)]  
ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]  
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]

Combina los elementos y produce una nueva lista. El primer elemento va con el primero, el segundo con el segundo, etc. Observe que debido a que los pares pueden tener diferentes tipos en ellos, zip puede tomar dos listas que contienen diferentes tipos y cerrarlas. ¿Qué sucede si las longitudes de las listas no coinciden?
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]  
[(5,"im"),(3,"a"),(2,"turtle")]  

La lista más larga simplemente se corta para que coincida con la longitud de la más corta. Debido a que Haskell es flojo, podemos cerrar listas finitas con listas infinitas:

ghci> zip [1..] ["apple", "orange", "cherry", "mango"]  
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]  

Aquí hay un problema que combina tuplas y comprensiones de listas: ¿qué triángulo rectángulo que tiene enteros para todos los lados y todos los lados iguales o menores a 10 tiene un perímetro de 24? Primero, intentemos generar todos los triángulos con lados iguales o menores que 10:

ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

Solo estamos dibujando de tres listas y nuestra función de salida las combina en un triple. Si evalúa eso escribiendo triángulos en GHCI, obtendrá una lista de todos los triángulos posibles con lados inferiores o iguales a 10. A continuación, agregaremos una condición de que todos tengan que ser triángulos correctos. También modificaremos esta función teniendo en cuenta que el lado b no es más grande que la hipotenusa y que el lado a no es más grande que el lado b.

ghci> let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

Ya casi terminamos. Ahora, simplemente modificamos la función diciendo que queremos aquellos donde el perímetro es 24.

ghci> let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  
ghci> rightTriangles'  
[(6,8,10)]

¡Y ahí está nuestra respuesta! Este es un patrón común en la programación funcional. Toma un conjunto inicial de soluciones y luego aplica transformaciones a esas soluciones y las filtra hasta obtener las correctas.


