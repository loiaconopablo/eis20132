class TenisGame

	def initialize(nombreJugadorUno,nombreJugadorDos)
		@nombreJ1 = nombreJugadorUno
		@nombreJ2 = nombreJugadorDos
		@puntajeJ1 = 0
		@puntajeJ2 = 0
	end

	def setPuntajeJ1(puntaje)
		@puntajeJ1 = puntaje
	end

	def setPuntajeJ2(puntaje)
		@puntajeJ2 = puntaje
	end

	def getPuntajeJ1
		@puntajeJ1
	end

	def getPuntajeJ2
		@puntajeJ2
	end

	def puntoJugadorUno
		self.setPuntajeJ1(self.getPuntajeJ1 + 1)
	end

	def puntoJugadorDos
		self.setPuntajeJ2(self.getPuntajeJ2 + 1)
	end

	def darPuntaje
		if (self.estanIgualesForty)
			return "Deuce"
		end

		if (self.getPuntajeJ1 == self.getPuntajeJ2)
			return self.traducir(getPuntajeJ1) + " all"
		end

		if (self.hayGanador)
			return self.nombrePuntajeMasAlto + " Gano!"
		end

		if (self.hayEnVentaja)
			return "Advantage "+self.nombrePuntajeMasAlto
		end

		return self.traducir(getPuntajeJ1)+"-"+self.traducir(getPuntajeJ2)
	end

	def estanIgualesForty
		if (self.getPuntajeJ1 >=3 and self.getPuntajeJ2 == self.getPuntajeJ1)
			return true
		else
			return false
		end
	end 

	def hayEnVentaja
		if (self.getPuntajeJ1 >= 4 && self.getPuntajeJ1 == self.getPuntajeJ2 + 1)
			return true
		end
		if (self.getPuntajeJ2 >= 4 && self.getPuntajeJ2 == self.getPuntajeJ1 + 1)
			return true	
		end
		return false
	end

	def hayGanador
		if (self.getPuntajeJ1 >= 4 && self.getPuntajeJ1 >= self.getPuntajeJ2 + 2)
			return true
		end
		if (self.getPuntajeJ2 >= 4 && self.getPuntajeJ2 >= self.getPuntajeJ1 + 2)
			return true	
		end
		return false
	end

	def nombrePuntajeMasAlto
		if self.getPuntajeJ1>self.getPuntajeJ2
			return @nombreJ1
		else
			return @nombreJ2
		end
	end

	def traducir(puntaje)
		case 
		when (puntaje == 0)
			return "Love"
		when (puntaje == 1)
			return "Fifteen"
		when (puntaje == 2)
			return "Thirty"
		when (puntaje == 3)
			return "Forty"
		end
	end

end