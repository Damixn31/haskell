### Comprension de listas

- En Haskell, las compresiones de listas son una forma concisa y poderosa de generar nuevas listas a partir de listas existentes. Se utilizan para aplicar transformaciones, filtrar elementos o realizar operaciones en una lista, todo en una única línea de código. Las compresiones de listas se basan en la idea de compresión de conjuntos en matemáticas.

La sintaxis general de una compresión de lista en Haskell es la siguiente:

```Haskell
  [expresion | elemento <- listaOriginal, condicion]
```

## Explicación de los componentes:

- expresion: Es una función o expresión que se aplicará a cada elemento de la lista original que cumpla con la condición.

- elemento: Es una variable que toma los valores de la lista original uno por uno.

- listaOriginal: Es la lista de entrada sobre la cual se realizará la compresión.

- condicion: Es una expresión booleana que filtra los elementos de la lista original. Solo los elementos que cumplan con esta condición se incluirán en la nueva lista generada.
