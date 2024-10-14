/*
Implementar en Wollok los objetos necesarios para calcular el sueldo de pepe.
El sueldo de pepe se calcula así: sueldo = neto + bono x presentismo + bono x resultados.
El neto depende de la categoría, hay varias categorías. Por ejemplo, los gerentes que ganan
$10000 de neto, y cadetes que ganan $15000, aunque puede haber más.
Hay tres posibilidades para el bono por resultados:
● 10% sobre el neto,
● $800 fijos,
● o nada
Hay dos bonos por presentismo:
● en uno es $1000 pesos si la persona a quien se aplica no faltó nunca, $500 si faltó sólo un
día, $0 en cualquier otro caso.
● En el otro siempre es $0, independientemente de las faltas.
1. Hacer un test con pepe como cadete, faltó 3 días, tiene un bono resultado $800, y tiene un
bono presentismo por faltas.. Debería tener $15800 de sueldo.
2. Hacer un test con pepe como gerente, con un bono resultados de porcentaje, y con un bono
de presentismo independiente de las faltas. El sueldo debe dar $11000.
3. Tests adicionales sugeridos:
● pepe cadete con bono de resultados por porcentaje, con un bono por presentismo de faltas,
nunca faltó. Debería tener $17500 de sueldo.
● pepe cadete con bono de resultados por porcentaje, con un bono por presentismo de faltas,
falto 1 día. Debería tener $17000 de sueldo.
*/

object pepe {
  var sueldo = 0
  var presentismo = 0
  var resultado = 0
  method sueldo() = sueldo


  method Neto(categoria){
    categoria.sueldo(self)
  }
  method bonoResu(catResultados){
    catResultados.sueldo(self)
  }
  method bonoPresentismo(catPresentismo){
    catPresentismo.sueldo(self)
  }


  method aumentarSueldo(cantidad) {
      sueldo += cantidad
  }
}

object gerentes {
  method sueldo(persona) {
    persona.aumentarSueldo(10000)
  }
}

object cadetes {
  method sueldo(persona) {
    persona.aumentarSueldo(15000)
  }
}


object porcentaje {
  var por = 0
  method sueldo(persona) {
    por= (persona.sueldo())/10
    persona.aumentarSueldo(por* (persona.resultados))
  }
}

object fijo {
  method sueldo(persona) {
    persona.aumentarSueldo(15000)
  }
}

object nada {
  method sueldo(persona) {
    persona.aumentarSueldo(15000)
  }
}