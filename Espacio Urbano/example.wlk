object secretaria {
  method evaluacion(espacioUrbano) {
    espacioUrbano.esGrande()
  }
}

//1
class EspacioUrbano {
   const tamano
   var nombre 
   var property valor
   var property vallado


  method tieneVallado()= vallado
   
  method esGrande() {
    return tamano > 50
   }

  method esVerde()= false

  method limpiable () = false
}

class Plazas inherits EspacioUrbano{
   const canchas = []
   var esparcimiemto 

   override method esGrande() = super() && canchas.size() > 2

   override method esVerde() = canchas == 0 

   override method limpiable () = true
}

class Plazoletas inherits EspacioUrbano{
   var cesped
   var procer

   override method esGrande() = super() && procer == "San Martin" && vallado
}

class Anfiteatros inherits EspacioUrbano{
   const capacidad
   override method esGrande() = super() && capacidad > 500

   override method limpiable () = self.esGrande()

}

class Multiespacios inherits EspacioUrbano{
   const espacios = []
   override method esGrande() = espacios.all({esp => esp.esGrande()})

   override method tieneVallado() = espacios.all({esp => esp.super()})

   override method esVerde() =  espacios.size() >3
}

//2
class Trabajador {
  var property rol 

  method trabajar(espacioUrbano) {
    
    if(rol.puedeTrabajar(espacioUrbano)){
     espacioUrbano.trabajo(espacioUrbano)
    }

  }
}

class rol {
  var property tiempo
}

class Cerrajeros inherits rol{
  method puedeTrabajar(espacioUrbano){
    return !espacioUrbano.tieneVallado()
  } 

  method trabajo(espacioUrbano){
    if(espacioUrbano.esGrande()){
     tiempo +=5
    }else{
      tiempo +=3
    }
    espacioUrbano.vallado(true)
    
  }
}

class Jardineros inherits rol{
  method puedeTrabajar(espacioUrbano){
    return !espacioUrbano.esVerdes()
  } 

  method trabajo(espacioUrbano){
    var agregado = espacioUrbano.valor()
    espacioUrbano.valor(agregado + agregado/100)
     tiempo += espacioUrbano.tamano() / 10
  }
}

class Encargados inherits rol{
  method puedeTrabajar(espacioUrbano){
    return !espacioUrbano.esVerdes()
  } 

  method trabajo(espacioUrbano){
    var agregado = espacioUrbano.valor()
    espacioUrbano.valor(agregado + agregado/100)
     tiempo += espacioUrbano.tamano() / 10
  }
}