class Celular {
  var property memoria = 1000
  var property bateria = 100
  const aplicaciones = []

  method memoriaLibre() {
    return memoria - self.cantidadOcupadoMB()
  }

  method cantidadOcupadoMB() {
    return aplicaciones.sum({unaApp => unaApp.cantMB()})
  }

  method gastoDeBateriaXminuto() {
    return aplicaciones.sum({unaApp => unaApp.gastoDeBateria()})
  }
}

class Chats {
  var property base
  var property consumoDeBateria = 1
  var property cantidadDeConversaciones
  var property consumoXconversacion   

  method cantMB() {
    return base + (cantidadDeConversaciones * consumoXconversacion)
  }

  method gastoDeBateria() {
    return cantidadDeConversaciones * consumoDeBateria
  }
}

class Reproductor {
  var property maximo
  var property cantidadDeReproduccion 
  var property consumoXreproduccion
  var property consumoDeBateria = 2 

  method cantMB() = maximo.max(cantidadDeReproduccion * consumoXreproduccion)
  
  method gastoDeBateria() = consumoDeBateria
}

object calculadora {
  method cantMB() = 10
  method gastoDeBateria() = 0
}

const whatsApp= new Chats(base = 40, consumoXconversacion = 5, cantidadDeConversaciones = 2) 
