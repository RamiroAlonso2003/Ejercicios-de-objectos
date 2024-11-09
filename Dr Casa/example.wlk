class Persona {
  var property temperatura = 36
  var property celulas = 3000000
  const property enfermedades = #{} 

  method contraeEnfermedad(enfermedad) {
    if(enfermedad.size()<7){
     enfermedades.add(enfermedad)
    } 
  }

  method tieneEnfermedad(enfermedad) {
    return enfermedades.contains(enfermedad)
  }

  method pasarUnDia() {
    enfermedades.forEach({enfer => enfer.efecto(self)})
  }

  method coma() = temperatura>45 and celulas >1000000
  
  method modificarTemperatura(cantidad) {
		temperatura = (temperatura + cantidad).min(45)
	}
	
	method modificarCelulas(cantidad) {
		celulas = (celulas + cantidad).max(0)
	}
  
  method recibirDosis(cantidad) {
    enfermedades.forEach({unaEnfermedad => unaEnfermedad.atenuar(cantidad, self)})
  }

  method curarseDe(enfermedad) {
 		enfermedades.remove(enfermedad)
 	}
}

class Medico inherits Persona{
  method darDosis(persona, cantidad) {
    persona.recibirDosis(-cantidad)
  }
}

class JefeDeDepartamente inherits Medico {
  const subordinados = []

  override method darDosis(persona, cantidad){
    subordinados.anyOne().darDosis(persona, cantidad)
  }

}

class Enfermedad {
  var property celulasAmenazadas

  method atenuar(dosis, persona) {
		self.reducirCantCelulasAmenazadas(dosis)
		if (celulasAmenazadas == 0) {
			persona.curarseDe(self)
		}
	}
	
	method reducirCantCelulasAmenazadas(dosis) {
		celulasAmenazadas = (celulasAmenazadas - dosis *15).max(0)
	}

}

class Infecciosas inherits Enfermedad {
  method efecto(persona) {
    persona.modificarTemperatura(celulasAmenazadas/1000)
  }
  
  method reproducirse() {
    celulasAmenazadas += celulasAmenazadas
  }

  method agresiva(persona) = persona.celulas()/1000 == celulasAmenazadas
}

class Autoinmunes inherits Enfermedad {
  var property dias = 0
  method efecto(persona) {
    persona.modificarCelulas(-celulasAmenazadas)
    dias+=1
  }

  method agresiva(persona) = dias > 30
}