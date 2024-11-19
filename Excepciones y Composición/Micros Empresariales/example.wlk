class Micro {
  var property cantSentados
  var property cantParados
  var property volumen
  var property pasajeros = []

  method subir(persona) {
    if (!self.puedeSubir(persona)) {
      throw "No se puede subir al empleado: no hay espacio o no acepta ir en el micro"
    }
    pasajeros.add(persona)
  }

  method puedeSubir(persona) {
    return self.hayEspacio() && persona.leGustaParaSubir(self)
  }

  method hayEspacio() {
    return self.cuantoEspacio() > 0
  }

  method cuantoEspacio() {
    return cantSentados + cantParados - pasajeros.size()
  }

  method bajar(persona) {
    if (!pasajeros.includes(persona)) {
      throw "Error: la persona no está en el micro"
    }
    pasajeros.remove(persona)
  }

  method apurados(persona) {
    return true // Implementar lógica específica si es necesario
  }

  method claustrofobicos(persona) {
    return volumen > 120
  }

  method fiacas(persona) {
    return cantSentados > pasajeros.size()
  }

  method moderados(persona) {
    return persona.cantMin < self.cuantoEspacio()
  }
}

class Empleado {
  var property preferencia
  var property cantMin

  method quieroSubir(micro) {
    micro.subir(self)
  }

  method leGustaParaSubir(micro) {
    return micro.preferencia(self)
  }
}

class Restaurante {

  

  method cuantoPagaraElCliente(persona, valor) {
    return persona.darPropina(valor) + valor
  }
}

class Cliente {
  var property tipo
  var property salario

  method darPropina(valor) = tipo.Propina(valor, salario)

  method cambiarTipo(nuevo) {
    tipo = nuevo
  }
}


