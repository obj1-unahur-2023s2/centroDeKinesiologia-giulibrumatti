import pacientes.*


class Aparato {

	method efectoEnDolor(dolor)
	
	method efectoFortaleza(fortaleza,edad,dolor)
	
	method puedeUsar(paciente)
	
}

class Magneto inherits Aparato{
	
	override method efectoEnDolor(dolor) = dolor * 0.9
	
	override method puedeUsar(paciente) = true
	
	override method efectoFortaleza(fortaleza,edad,dolor){
		return fortaleza
	}
	
}

class Bicicleta inherits Aparato{
	
	override method efectoEnDolor(dolor) = dolor - 4
	
	override method efectoFortaleza(fortaleza,edad,dolor) = fortaleza + 3
	
	override method puedeUsar(paciente) = paciente.edad() > 8
	
}

class Minitramp inherits Aparato{
	
	override method efectoEnDolor(dolor) = dolor
	
	override method efectoFortaleza(fortaleza,edad,dolor) = fortaleza + (edad * 0.1)
	
	override method puedeUsar(paciente) = paciente.dolor() < 20
	
}