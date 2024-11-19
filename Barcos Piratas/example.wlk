/*
Barcos Piratas
Los barcos piratas reclutan tripulantes. Cada barco pirata tiene una misión que quiere cumplir, y por eso es útil saber qué parte de su tripulación le sirve para dicha misión. Un barco puede cambiar de misión en cualquier momento.
Existen tres tipos de misiones: búsquedas del tesoro, convertirse en leyenda y saqueos. Una misión, no importa de qué tipo, necesita de piratas intrépidos: ellos son los jóvenes (menos de 40 años) que además no temen morir.
Además, cada tipo de misión tiene sus particularidades:
●  Convertirse en Leyenda:   Para que un pirata sea útil en una misión de convertirse en leyenda debe tener al menos 10 ítems (cada pirata sabe lo que lleva).
● Búsqueda del Tesoro: Para esta clase de misiones sólo serán útiles como tripulantes aquellos piratas que tengan una brújula o una botella de grogXD entre sus ítems, y no tengan más de 50 años.
●  Saqueo: Los saqueos tienen un objetivo o víctima, que puede ser un barco o una ciudad costera. Para estas misiones son útiles los piratas que cuenten con menos dinero que una cantidad de monedas determinada para cada misión de saqueo particular.
 Se pide que resuelva qué piratas de un barco pueden formar parte de una misión.

*/

class Barcos {
  
  const tripulantes = []
  var property mision
  var elegidos = []

  method cambiarMision(nueva) {
    mision = nueva
  }

  method buscarCandidatos() {
    
    tripulantes.forEach({tripulante => 
    if(tripulante.sirveParaMision(mision)){
        elegidos.add(tripulante)
      }
    })

  }
   
}

class Pirata {
  
  const edad
  const tieneMiedo
  const items = []
  const dinero

  method esIntrepido() = edad < 40 && !tieneMiedo

  method sirveParaMision(mision) {
    mision.esIntrepido() && mision.condicion(self)
  }

  method cantidadDeItems() = items.size() 

  method contiene(item) {
    items.contains(item)
  }
   
}


object leyenda {
  
  method condicion(pirata) = pirata.cantidadDeItems() > 10

}

object tesoro {
  method condicion(pirata) = (pirata.contiene("brujula") || pirata.contiene("botella de grogXD")) && pirata.edad <= 50
}

object Saqueo{
  const cantidadMaximaMonedas

  method condicion(pirata) = pirata.dinero() < cantidadMaximaMonedas
}