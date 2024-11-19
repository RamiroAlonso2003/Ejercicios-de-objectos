class Micro {
    var capacidadSentados
    var capacidadParados
    var volumen
    var pasajeros = []
  
   method hayLugar() {
        return (pasajeros.size() < (capacidadSentados + capacidadParados))
    }

    method subirEmpleado(empleado) = self.hayLugar() and empleado.quieroSubir(self)

    method lugaresLibres() {
        return (capacidadSentados + capacidadParados - pasajeros.size())
    }  
}
