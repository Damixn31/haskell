module Quotes (Quote, quotes, text, autor) where

data Quote = Quote {text :: String, autor :: String}

quotes :: [Quote]
quotes = [
      Quote "El hombre es la medida de todas las cosas." "Protágoras",
      Quote "Sólo sé que no sé nada." "Sócrates",
      Quote "La vida es un sueño, y los sueños, sueños son." "William Shakespeare",
      Quote "La filosofía es un campo de batalla, no un cuarto de recreo." "Karl Marx",
      Quote "Dios ha muerto. ¡Viva el hombre!" "Friedrich Nietzsche",
      Quote "La libertad es lo que haces con lo que se ha hecho de ti." "Jean-Paul Sartre",
      Quote "La vida es absurda y está llena de sufrimiento, pero también tiene un propósito y un potencial para la felicidad." "Albert Camus",
      Quote "El ser humano es libre, pero está en cadenas en todas partes." "Jean-Jacques Rousseau",
      Quote "No podemos resolver problemas usando el mismo tipo de pensamiento que usamos cuando los creamos." " Albert Einstein"
    ]
