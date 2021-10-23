object chasqui
{
	method puedeMandar(mensaje) = mensaje.length() < 50
	method costo(mensaje) = mensaje.length() * 2
}

object sherpa
{
	var property valorMensaje = 60

	method puedeMandar(mensaje) = mensaje.length().even()
	method costo(mensaje) = valorMensaje
}

object messich
{
	var property valorCosto = 10
	
	method puedeMandar(mensaje) = not mensaje.startsWith('a') //Otra opción podría ser mensaje.take(1) != 'a' 
	method costo(mensaje) = valorCosto * mensaje.words().size()
}

object pali
{
	method puedeMandar(mensaje) = self.esPalindromo(mensaje)
	
	method esPalindromo(mensaje)
	{
		const mensajeSinEspacios = mensaje.words().join("")
		return mensajeSinEspacios.equalsIgnoreCase(mensajeSinEspacios.reverse())
	}
	
	method costo(mensaje)
	{
		const costo = mensaje.length() * 4
		return costo.min(80)
	} 
}

object agenciaMensajeria
{
	const mensajeros = [chasqui,sherpa,messich,pali]
	
	method mensajerosPosibles(mensaje) = mensajeros.filter({unMensajero => unMensajero.puedeMandar(mensaje)}) 
	
	method pedirMensajero(mensaje) = self.mensajerosPosibles(mensaje).min({unMensajero => unMensajero.costo(mensaje)})
}







