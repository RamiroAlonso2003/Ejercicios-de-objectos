/*
El lobo Yamilo (que es el nombre oculto del popular personaje de cuentos infantiles) quiere un sistema para simular sus actividades diarias y poder saber si va a dejar de estar con sobrepeso (o “rellenito” como piensa él cada vez que se mira al espejo)
Se desea:
Conocer la cantidad de calorías actual de yamilo.
Que el lobo se pueda comer al chanchito de la casa de paja (aporta tantas calorías como su peso dividido 10).
Saber si el lobo está con sobrepeso (o sea, si tiene más de 200 calorías).
Saber si el lobo está saludable ( sea, tiene entre 20 y 150 calorías)
Hacer que el lobo corra un determinado tiempo (quema 2 calorías por minuto)

*/
object yamilo {
	var calorias = 120
	
	method calorias(cantCalorias) {
		calorias = cantCalorias
	}
	
	method calorias() {
		return calorias
	}
	
	
	method comerA(unChanchito) {
		calorias += (unChanchito.peso()/10)
	}
	
	method tieneSobrepeso() = calorias > 200
	
	method estaSaludable() = calorias.between(20, 150)
	
	method correr(cantMinutos) {
		calorias -= cantMinutos *2
	}
}

object chanchitoCasaDePaja {
	const peso = 100
	
	method peso() = peso
	
}
object chanchito {
  const peso = 50

  method peso() = peso
}