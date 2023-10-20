

class Paciente {
	const property edad
	var fortaleza
	var dolor
	const rutina = []
		
	method fortaleza() = fortaleza
	
	method dolor() = dolor

	method sePuedeUsar(aparato) = aparato.puedeUsar(self)
	
	method usarAparato(aparato){
		if(!self.sePuedeUsar(aparato)){
			self.error("El paciente no puede usar ese aparato")
		}
		aparato.efectoDelUso(self)
		fortaleza += aparato.valorQueSumaFortaleza(self)
		dolor = 0.max(dolor - aparato.valorRestaDolor(self))
	}
	
	method asignarRutina(listaAparato){
		rutina.addAll(listaAparato)
	}
	
	method realizarRutina() {
		if(!self.puedeRealizarRutina()){
			self.error("El paciente no puede hacer rutina porque tiene aparatos que no puede usar")
		}
		rutina.forEach({a => self.usarAparato(a)})
	}
	
	method puedeRealizarRutina() = rutina.all({a => self.sePuedeUsar(a)})
	
	method cantidadDeAparatosEnRutina() = rutina.size()
	
}

class Resistente inherits Paciente{
	
	override method realizarRutina(){
		super()
		fortaleza += self.cantidadDeAparatosEnRutina()
	}
}

class Caprichoso inherits Paciente{
	
	override method realizarRutina(){
		//(1..2).forEach({e => super()})
		super()
		super()
	}
	
	override method puedeRealizarRutina() = super() && self.hayAparatoDeColor("rojo")
	
	method hayAparatoDeColor(color) = rutina.any({a => a.color() == color})
}

class RapidaRecuperacion inherits Paciente{
	
	override method realizarRutina(){
		super()
		dolor = 0.max(dolor - coeficienteRecuperacion.valor())
	}
}

object coeficienteRecuperacion{
	var property valor = 3
}
