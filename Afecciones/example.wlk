/*
Afecciones
De sara se conoce el peso 55kg, vitalidad 90 y temperatura 37. Y además se
conoce las siguientes enfermedades que puede afectarla.
● malaria, al afectar a una persona aumenta en 3 unidades la temperatura.
● varicela, al afectar disminuye la vitalidad de la persona en 5 unidades y
disminuye un 10% el peso de la persona.
● gripe disminuye la vitalidad de la persona en un 20%.
Por otra parte se conocen en el sistema las siguientes dosis, alimentos que también
afectan.
● paracetamol si la fiebre es mayor a 37 produce una disminución hasta 37
grados, sino no hace nada
● polen produce un aumento de la vitalidad de la persona en un 10% de la
cantidad de gramos.
● nuez aumenta la vitalidad de la persona en un 30%.
Crear en Wollok los objetos y todo lo necesario para hacer lo siguiente:
● Hacer que sara sea afectada por la malaria.
● Hacer que sara sea afectada por la varicela.
● Hacer que sara sea afectada por una gripe.
● Pedir que sara ingiera una dosis de paracetamol.
● Pedir que sara ingiera 10 gramos de polen.
● Pedir que sara consuma una nuez
*/

object sara {
	
	var property vitalidad = 90
	var property peso = 55
	var property temperatura = 37
	
	method esAfectadaPor(algo) {
		algo.afectarA(self)
	}
	
	method modificarTemperatura(cantidad) {
		temperatura += cantidad
	}
	
	method modificarVitalidad(cantidad){
		vitalidad += cantidad
	}
	
	method modificarPeso(cantidad) {
		peso += cantidad
	}
}

object malaria {
	
	method afectarA(persona){
		persona.modificarTemperatura(3)
	}
}

object varicela {
	
	method afectarA(persona) {
		persona.modificarVitalidad(-5)
		persona.modificarPeso(persona.peso()*(-0.1))
	}
}

object gripe {
	
	method afectarA(persona) {
		persona.modificarVitalidad(persona.vitalidad() *(-0.2))
	}
	
}

object paracetamol {
	method afectarA(persona) {
		if (persona.temperatura() > 37) {
			persona.temperatura(37)
		}
	}
}

object polen {
	var property gramos = 10
	method afectarA(persona) {
		persona.modificarVitalidad(gramos * 0.1)
	}
}

object nuez {
	method afectarA(persona) {
		persona.modificarVitalidad(persona.vitalidad() * 0.3)
	}
}