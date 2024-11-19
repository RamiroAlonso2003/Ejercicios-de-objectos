
class Autonomo {
    var energia
    var vitalidad
    var fuerza
    var fechaNacimiento
    var actividadPrinc
    var actividadSecu = []

    method edad() {
        return new Date().year() - fechaNacimiento.year()
    }

    method realizarActividadPrincipal() {
        actividadPrinc.hacer(self)
    }

	method subirEnergia(cantidad) {
		energia += cantidad
	}

    method bajarEnergia(cantidad) {
        energia -= cantidad
    }

    method cantidadProductos() {
        return actividadPrinc.cantidadDiaria()
    }

    method hacerListaActividades() {
        actividadSecu.forEach({ actividad => self.realizarActividadSecundaria(actividad) })
    }

    method realizarActividadSecundaria(actividad) {
        if (energia != 0) {
            actividad.hacer(self)
        } else {
            throw new Exception(message = "No tiene energía")
        }
    }

    method calidadDeVida() {
        return self.edad() * 0.06
    }
}

class Extranjero inherits Autonomo {
    var aniosEnIsla

    override method calidadDeVida() {
        return super() + aniosEnIsla * 0.5
    }
}

class ActividadPrincipal {
    var cantidadDiaria = 0
    var productos = []

}

object tierra {
    method extraer() {
        return 10 // Cantidad fija de producto extraído
    }
}

object agricultor inherits ActividadPrincipal {
   method hacer(poblador) {
        productos.add(tierra.extraer())
    }
}

object abejas {
    method extraer() {
        return 10 // Cantidad fija de producto extraído
    }
}

object aplicultor inherits ActividadPrincipal {
   method hacer(poblador) {
        productos.add(abejas.extraer())
    }
}

object mar {
    method extraer() {
        return 10 // Cantidad fija de producto extraído
    }
}

object pesquero inherits ActividadPrincipal {
   method hacer(poblador) {
        productos.add(mar.extraer())
    }
}

// Actividad: Correr
object correr {
    var cantidadMetros = 0 // Distancia que el poblador corre

    method hacer(poblador) {
        const energiaGastada = cantidadMetros / 2
        const fuerzaGanada = cantidadMetros * 0.2

        poblador.bajarEnergia(energiaGastada)
        poblador.fuerza(poblador.fuerza()+ fuerzaGanada)
    }
}

// Actividad: Ciclismo
object ciclismo{
    var velocidad = 0 // Velocidad a la que el poblador pedalea

    method hacer(poblador) {
        const energiaGastada = velocidad / 2
        const vitalidadGanada = velocidad / 3

        poblador.bajarEnergia(energiaGastada)
        poblador.vitalidad(poblador.vitalidad()+vitalidadGanada)
    }
}

// Actividad: Saltar la Soga
object saltarLaSoga{
    var cantidadSaltos = 0 // Cantidad de saltos realizados

    method hacer(poblador) {
        const energiaGastada = cantidadSaltos
        const vitalidadGanada = cantidadSaltos / 2

        poblador.bajarEnergia(energiaGastada)
        poblador.vitalidad(poblador.vitalidad()+vitalidadGanada)
    }
}

// Actividad: Consumir Ración
object consumirRacion {
    var productosConsumidos = [] // Lista de productos consumidos

    method hacer(poblador) {
        const energiaGanada = productosConsumidos.sum({ producto => producto })
        poblador.subirEnergia(energiaGanada)
    }
}
