class Juego

	def set_palabra(a_word)
		@word = a_word
		@errores = 0
	end

	def verificar_letra	(a_letter)
		if @word.include? a_letter
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

end