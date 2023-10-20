import pacientes.*
import aparatos.*	

object centro {
	const aparatos = []
	const pacientes = #{}
	
	method agregarAparatos(listaAparatos) = aparatos.addAll(listaAparatos)
	
	method agregarPacientes(listaPacientes) = pacientes.addAll(listaPacientes)
	
	method coloresAparatos() = aparatos.map({a => a.color()}).asSet()
	
	method pacientesMenoresDe8Anios() = pacientes.filter({p => p.edad() < 8})
	
	method cantidadPacientesQueNoPuedenRealizarRutina() = pacientes.count({p => !p.puedeRealizarRutina()})
	
	method estaOptimo() = aparatos.all({a => !a.necesitaMantenimiento()})
	
	method estaComplicado() = self.aparatosParaMantenimiento().size() >= self.cantidadAparatos() / 2
	
	method cantidadAparatos() = aparatos.size()
	
	method aparatosParaMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()})
	
	method visitaTecnico(){
		self.aparatosParaMantenimiento().forEach({a => a.recibirMantenimiento()})
	}
}
