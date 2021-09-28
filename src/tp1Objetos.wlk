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
	var valorCosto = 10
	method puedeMandar(mensaje) = not mensaje.startsWith('a') //Otra opción podría ser mensaje.take(1) != 'a'
	method setearValorCosto(n) {
		valorCosto = n
	} 
	method costo(mensaje){
		return valorCosto * (mensaje.words()).size()
	} 
}

object pali
{
	/*
	method puedeMandar(mensaje) 
	{
		const mensajeLimpio = mensaje.words().join("").toLowerCase()
		return mensajeLimpio.equals(mensajeLimpio.reverse())
	}*/
	
	method puedeMandar(mensaje) 
	{
		const mensajeSinEspacios = mensaje.words().join("")
		return mensajeSinEspacios.equalsIgnoreCase(mensajeSinEspacios.reverse())
	}
	
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







