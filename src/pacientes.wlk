

class Paciente {
	var edad
	var fortaleza
	var dolor
	
	method edad() = edad
	
	method fortaleza() = fortaleza
	
	method dolor() = dolor
	
	method modificarDolor(nuevoDolor){
		dolor = nuevoDolor
	}
	
	method modificarFortaleza(nuevaFort) {
		fortaleza = nuevaFort
	}
	
	method usarAparato(aparato){
		aparato.efectoEnDolor(self)
		aparato.efectoFortaleza(self)
	}
	
	method puedeHacerEjercicio(rutina) = rutina.puedeHacerRutina() && self.condicionAdicional(rutina)
	
	method condicionAdicional(rutina) = false
	
	method hacerEjercicio(rutina) {
		rutina.hacerRutina()
	} 
}

class Resistente inherits Paciente{
	
	override method usarAparato(aparato){
		super(aparato)
		fortaleza = fortaleza + 1
	}
}

class Caprichoso inherits Paciente{
	
	override method condicionAdicional(rutina) = rutina.hayAparatoDeColor("rojo")
	override method hacerEjercicio(rutina){
		super(rutina)
		rutina.hacerRutina(rutina)
	}
}

class RapidaRecuperacion inherits Paciente{
	
	override method hacerEjercicio(rutina){
		super(rutina)
		self.modificarDolor(self.dolor() - 3)
	}
}
