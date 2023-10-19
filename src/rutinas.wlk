import pacientes.*
import aparatos.*

class Rutina {
	var property paciente
	const aparatos = new List()
	
	
	method puedeHacerRutina(){
		return aparatos.all({a => a.puedeUsar(paciente)})
	}
	
	method hacerRutina(){
		aparatos.forEach({a => paciente.usarAparato(a)})
	}
	
	method cargarAparatos(unaLista){
		aparatos.addAll(unaLista)
	}
	
	method cantidadDeAparatos() = aparatos.size()
	
	method hayAparatoDeColor(color) = aparatos.any({a => a.color() == color})
}
