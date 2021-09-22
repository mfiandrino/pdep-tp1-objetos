object chasqui
{
	method puedeMandar(mensaje) = mensaje.length() < 50
	method costo(mensaje) = mensaje.length() * 2
}

object sherpa
{
	method puedeMandar(mensaje) = false
	method costo(mensaje) = 0
}

object messich
{
	method puedeMandar(mensaje) = false
	method costo(mensaje) = 0
}

object pali
{
	method puedeMandar(mensaje) = mensaje == mensaje.reverse() //Ver porque cuenta espacios y es case sensitive
	
	method costo(mensaje)
	{
		const costo = mensaje.length() * 4
		if(costo > 80)
			return 80
		else
			return costo
	} 
}

object agenciaMensajeria
{
	const mensajeros = [chasqui,sherpa,messich,pali]
	
	method mensajerosPosibles(mensaje) = mensajeros.filter({unMensajero => unMensajero.puedeMandar(mensaje)}) 
	
	method pedirMensajero(mensaje) = self.mensajerosPosibles(mensaje).min({unMensajero => unMensajero.costo(mensaje)})
}







