import pacientes.*


class Aparato {
	
	var property color = "blanco"

	method efectoEnDolor(paciente)
	
	method efectoFortaleza(paciente)
	
	method puedeUsar(paciente)
	
	
}

class Magneto inherits Aparato{
	
	override method efectoEnDolor(paciente) = paciente.modificarDolor(paciente.dolor() * 0.9)
	
	override method puedeUsar(paciente) = true
	
	override method efectoFortaleza(paciente) =  paciente.fortaleza()
	
	override method color(nuevoColor){
		color = nuevoColor
	}
	
}

class Bicicleta inherits Aparato{
	
	override method efectoEnDolor(paciente) = paciente.modificarDolor(paciente.dolor() - 4)
	
	override method efectoFortaleza(paciente) = paciente.modificarFortaleza(paciente.fortaleza() + 3)
	
	override method puedeUsar(paciente) = paciente.edad() > 8
	
	override method color(nuevoColor){
		color = nuevoColor
	}
	
}

class Minitramp inherits Aparato{
	
	override method efectoEnDolor(paciente) = paciente.dolor()
	
	override method efectoFortaleza(paciente) = paciente.modificarFortaleza(paciente.fortaleza() + (paciente.edad() * 0.1))
	
	override method puedeUsar(paciente) = paciente.dolor() < 20
	
	override method color(nuevoColor){
		color = nuevoColor
	}
	
}