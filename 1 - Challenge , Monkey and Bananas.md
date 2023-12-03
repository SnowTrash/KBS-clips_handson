
https://github.com/dainiuskreivenas/monkeys

Debemos modelar la realidad

Ceiling
Room
Banana
Monkey
Chair 
Desk
Floor




	Objetivo:
El problema está hambrinto o molesto y para que deje de estarlo debe comer la banana


El mono aunque brinque o salte se encuentra en una esquina del cuarto y por tanto desde ese lugar no puede alcanzar las bananas.


Si comenzamos a ver las relaciones entre los objetos podremos ver que el escritorio está alineado a las bananas pero el mono al inicio no lo está.


además aunque estuviese alineado a los platanos, saltando no podría conseguir las bananas.




El sistema de conocimiento, a partir de una secuencia de acciones.

Siguiendo un estricto orden lógico se debe solucionar.

Es un problema de planeación o de construcción de un plan.

y el sistema debe poder generar un conjunto de acciones, que en un orden estrictamente lógico deba seguir el changuito para hacerse de las bananas.


El reto es crear un KBS , de un conjunto de reglas y hechos.
El sistema debe resolver el problema, el sistema debe arrojarnos un plan, o un conjunto de acciones que un mono debe realizar.



Quizá podemos definir las distintas alturas.

El salto hace +2 hacia arriba y los objetos +1 o algo así y los platanos están en la altura del techo -1 o algo así.


el conjunto de reglas serán las acciones permitidas en la realidad del mono




## Primero modelar la realidad

## Las reglas condicion - acción 6



El mono debe desplazarse a la silla,
subirla al escritorio,
que el chango se suba al escritorio, encima a la silla,
baje las bananas y consuma estas

El plan o la solución que nos arroje el sistema debe tener aquellos pasos..


Para que el mono pueda agarrar la silla, debe tener libres sus manos, debemos verificar que esto no esté sucediendo.


Las condiciones
	1 que sus manos esten libres
	2 que el mono tenga la fuerza para levantar la silla.

Estando posicionado.


"Podemos asumir que el mono está al lado de la silla"
despues si se cumplen las condiciones mencionadas arriba,
entonces el evento se dispara (silla levantada) , esto debería representar un hecho.


	ASUMIENDO CONDICION 1 y 2 ENTONCES;- ----> Levantar la silla (silla lenantada: true)
		y por ello (silla en el piso: false)

La realidad modelada debe interactuar de forma activa con el agente

un poco maturanistico, la estructura del mono cambiaría dejando de permitirle cargar otros objetos, inclusive, cortando el acceso al estado de la silla en el piso como verdadero, mientras el estado de la silla levantada es falsa.



Cuando un hecho se dispara la realidad se modifica, porque entonces cuando se levanta la silla el hecho que modela el contacto de la silla con el suelo, se debe eliminar de la memoria de trabajo esa condicion, volviendo falso.



 "NO ES NECESARIO IMPLEMENTAR LAS REGLAS ORDENADAS EN ORDEN LÖGICO"
El pattern matcher se encargará de ello, puedes incorporar las distintas reglas y el sistema se encargará de correr aquellas reglas en el orden que se cumplen.
	PERO: debes imprimir en pantalla las distintas fases y reglas disparadas

solo importa que el orden en que se imprimen las acciones sea lógico

el orden de las reglas no debería ser el tipicamente lógico, tan solo las impresiones obtenidas.

LOS 2 CONCEPTOS MAS IMPORTANTES

deben ser

# EL estado inicial

Hungry(monkey)
isOn(Chair,floor)
isOn(Desk, floor)
IsOn(Monkey,floor)
IsOn(banana,ceilling)

# EL estado final

Happy(monkey)
isOn(Chair,desk)
isOn(Desk, floor)
Eat(Monkey,banana)
IsOn(Monkey,chair)


El objetivo está definido y puede ser marcado como "cumplido" cuando los hechos de la realidad son los del estado final.

Cambiaron los hechos relacionados a la silla, a la banana y al mono.

¿Cómo el sistema confirma que ya construyó el plan?

cuando el conjunto de acciones etán contenidas en el estado final.



DEBES IMPRIMIR EN PANTALLA LAS ACCIONES QUE EL SIMIO O EL ROBOT DEBE IMPRIMIR.
