/*
Game Worlds

Se necesita crear un Mundial de juegos y nos pidieron armar un sistema para organizarlo.
Para comenzar, vamos a tener a los jugadores, que serán aquellos que participarán para levantar la copa.
Todos los jugadores del Mundial, deben poder identificarse según si:
● Son titulares: para ser titular, nuestro jugador debe tener una antigüedad mayor a 3 años.
● Tienen experiencia, para tener experiencia nuestro jugador debe tener más de 2 competencias internacionales jugadas.
● Pueden jugar: para poder jugar debe ser titular y tener experiencia.

1. Vamos a crear algunos jugadores.
a. Rekkles: El primer jugador que queremos sumar a nuestro sistema es Rekkles, un jugador sueco. De él sabemos que:
● Tiene 9 años de antigüedad, es decir qué hace 9 años está activo como jugador profesional de eSports.
● Participó en 14 competencias internacionales a lo largo de su carrera.

b. Josedeodo: Ahora queremos agregar a Josedeodo, un jugador argentino. De él sabemos que:
● Tiene 4 años de antigüedad, es decir que hace 4 años está activo como jugador profesional de eSports.
● Participó en 1 competencia internacional a lo largo de su carrera.

Al ser un jugador, también tiene que tener los métodos esTitular y puedeJugar.

2. Como los jugadores practican muchas horas seguidas, pueden cansarse fácilmente. Decimos que todos los jugadores van a comenzar con un nivel de cansancio igual a 0. Además queremos que tengan la opción de tomar bebidas energizantes, que les disminuirá el nivel de cansancio según la cantidad de bebidas multiplicado por 10.

3. ¡Se nos sumó un nuevo jugador! Faker, el jugador surcoreano, que al ser uno de los jugadores con más copas mundiales, no le aplican los mismos criterios que al resto de los jugadores. Lo que sabemos de Faker hasta ahora es que suele tiltearse mucho. Vamos a querer poder consultar si está tilteado, y poder hacer que se tome un tecito para dejar de estarlo. Además sabemos que para que pueda jugar no tiene que estar tilteado. 

4. Dado que esto es una competencia, vamos a tener partidas, en donde dos o más jugadores (de cualquier tipo) van a poder enfrentarse. En ellas, vamos a necesitar los siguientes mensajes:
a.  agregarParticipante(participante): este mensaje nos permitirá agregar un nuevo participante a la partida.
b. comenzar(): este mensaje hará que todos los participantes jueguen. Cuando un jugador normal juega, este aumentará su cansancio en 20; en cambio si el participante es Faker, al jugar aumentará en 50 su habilidad.
c. ganador(): la partida la ganará aquel que tenga mayor habilidad. Para un jugador normal, la habilidad está dada por su antigüedad multiplicada por 2, más las competencias internacionales por 3 menos su nivel de cansancio. 
Para Faker en cambio, su habilidad será 0 si está tilteado, si no lo está retornará la habilidad que tenga acumulada.

5. ¡Aparece un nuevo tipo de participante! Algunos jugadores en lugar de lanzarse a competir individualmente decidieron unirse en equipos para poder tener mayores chances de ganar. 
Un equipo estará conformado por cierta cantidad de jugadores, y siempre vamos a poder contratar nuevos, sin embargo no todos están disponibles para jugar, solo lo estarán aquellos que cumplan las condiciones de puedeJugar().
Cuando un equipo juegue, tiene que hacer que sus jugadores disponibles jueguen. La habilidad de un equipo estará dada por la suma de habilidades de todos sus jugadores (estén o no disponibles).


*/

class Jugador {
  var property cansansio = 0 
  var property antiguedad
  var property compeInternacionales

  method titular() {
    antiguedad > 3
  }

  method experiencia() {
    compeInternacionales > 2
  }

  method puedeJugar() {
    self.antiguedad() and self.compeInternacionales()
  }
 
 method tomarBebidasEnergizantes(bebidasEnergizantes) {
   cansansio -= 0.max(bebidasEnergizantes * 10)
 }

    method jugar() {
		cansansio += 20
	}

}


const rekkles = new Jugador(antiguedad = 9, compeInternacionales = 14)
const josedeodo = new Jugador(antiguedad = 4, compeInternacionales = 1)

object faker {
	var  estaTilteado = false
	var property cantHabilidad = 0
	
	
	method tomarTecito() {
		estaTilteado = false
	}
	
	method puedeJugar() = estaTilteado.negate()
	
	method jugar() {
		cantHabilidad += 50; 
	}
	
	method habilidad() {
		if (estaTilteado) {
			return 0
		}
		return cantHabilidad
	}

 }

object competencia {
	const property participantes = []
	var property cantHabilidad = 0
	
	
	method agregarParticipante(participante){
		participantes.add(participante)
	}
	
	method  comenzar() {
		participantes.forEach({unJugador => unJugador.jugar()})
	}

	method ganador() {
		participantes.max({unParticipante => unParticipante.habilidad()})
	}
 }

class Equipo {
  const property jugadores = []

  method contratar(unJugador) {
		jugadores.add(unJugador)
	}
	
	method jugar() {
		self.jugadoresDiponibles().forEach({unJugador => unJugador.jugar()})
	}
	
	method jugadoresDiponibles() {
		return jugadores.filter({unJugador => unJugador.puedeJugar()})
	}
	
	method habilidad() = jugadores.sum({unJugador => unJugador.habilidad()})
}