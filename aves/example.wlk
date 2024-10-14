object pepita {
  var energy = 100 //ATRIBUTOS

  method energy() = energy

  method vuela(metros) {
    energy = energy - metros
  }

  method comer(gramos) {
    energy += 2*gramos
  }
}