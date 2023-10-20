import pacientes.*


class Aparato {
	
	const property color = "blanco"
	
	method valorQueSumaFortaleza(unPaciente) = 0
	
	method valorRestaDolor(unPaciente) = 0

	method puedeUsar(unPaciente) = true
	
	method efectoDelUso(unPaciente)
	
	method necesitaMantenimiento() = false
	
	method recibirMantenimiento(){}
	
}

class Magneto inherits Aparato{
	var imantacion = 800
	
	override method valorRestaDolor(unPaciente) = unPaciente.dolor() * 0.1
	
	override method efectoDelUso(unPaciente) {
		imantacion = 0.max(imantacion - 1)
	}
	override method necesitaMantenimiento() = imantacion < 100
	
	override method recibirMantenimiento(){
		imantacion = 800.min(imantacion + 500) 
	}
}

class Bicicleta inherits Aparato{
	var cantTornillos = 0
	var cantAceite = 0
	
	override method valorRestaDolor(unPaciente) =  4
	
	override method valorQueSumaFortaleza(unPaciente) = 3
	
	override method puedeUsar(unPaciente) = unPaciente.edad() > 8
	
	override method efectoDelUso(unPaciente){
		if(unPaciente.dolor() > 30){
			cantTornillos ++
		}
		
		if(unPaciente.edad().between(30,50)){
			cantAceite++
		}
	}
	override method necesitaMantenimiento() = cantTornillos >= 10 || cantAceite >= 5
	
	override method recibirMantenimiento(){
		cantTornillos = 0
		cantAceite = 0
	}
}

class Minitramp inherits Aparato{
	
	override method valorQueSumaFortaleza(unPaciente) = unPaciente.edad() * 0.1
	
	override method puedeUsar(unPaciente) = unPaciente.dolor() < 20
	
	override method efectoDelUso(unPaciente){}

}