

class Paciente {
	var edad
	var fortaleza
	var dolor
	
	method edad() = edad
	
	method fortaleza() = fortaleza
	
	method dolor() = dolor
	
	method usarAparato(aparato){
		dolor = 0.max(aparato.efectoEnDolor(dolor))
		fortaleza = aparato.efectoFortaleza(fortaleza, edad, dolor)
	}
	
}

class Resistente inherits Paciente{
	
	override method usarAparato(aparato){
		super(aparato)
		fortaleza = fortaleza + 1
	}
}

class Caprichoso inherits Paciente{
	
}
