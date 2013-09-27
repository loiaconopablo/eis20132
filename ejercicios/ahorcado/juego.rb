class Juego

	def set_palabra(a_word)
		@word = a_word
		@errores = 0
		@aciertos = Array.new(self.obtener_longitud, "__")
	end

	def verificar_letra	(a_letter)
		if @word.include? a_letter
			@aciertos
			return true
		else
			@errores +=1
			return false
		end
	end

	def obtener_longitud
		@word.size
	end

	def get_errores
		@errores
	end

	def get_aciertos
		@aciertos



	def status


	def fin_juego
		if @errores = = 10
			retun 'Perdiste, la palabra era '+@word
		end
	end


end