class Persona {
  var property posicion
  const property elementosCerca = []
  var criterio 

  method pedirUnaCosa(comensal, cosa) {
       criterio.darUnaCosa(self, comensal, cosa)
  }
}

object sordo {
  
  method darUnaCosa(comensal1, comensal2, cosa) {
    const cosaDada = comensal2.elementosCerca().taken(1) 
    comensal2.elementosCerca().remove(cosaDada)
    comensal1.elementosCerca().add(cosaDada)
  }
}

object pasarTodo {
  
  method darUnaCoda(comensal1, comensal2, cosa) { 
    comensal2.elementosCerca().forEach({elem => comensal1.elementosCerca().add(elem)})
    comensal2.clear()
  }
}