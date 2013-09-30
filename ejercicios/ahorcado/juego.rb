class Juego

	def set_palabra(a_word)
		@word = a_word
		@errores = 0
		@aciertos = Array.new(self.obtener_longitud, "__")
	end

	def verificar_letra	(a_letter)
		if @word.downcase.include? a_letter.downcase
			self.obtener_ubicaciones_letra (a_letter)
			print "Acertaste la letra "+a_letter+". "
			self.gane_o_perdi_?
			return "Acertaste la letra "+a_letter
		else
			@errores +=1
			puts "Te quedan " + "#{10-@errores}" +" intentos. "
			self.gane_o_perdi_?
			return "Te quedan " + "#{10-@errores}" +" intentos."
		end
	end

	def obtener_longitud
		@word.size
	end

	def obtener_ubicaciones_letra (a_letter)
		contador = 0
		while contador < self.obtener_longitud
			if self.compara_letras(@word[contador], a_letter)
				@aciertos[contador]= a_letter
			end
			contador = contador+1
		end
		contador = 0
	end

	def compara_letras (letterA, letterB)
		if (letterA.casecmp letterB)== 0
			return true
		else
			return false
		end
	end

	def get_errores
		@errores
	end

	def get_aciertos		
		puts "#{@aciertos}"
		return @aciertos
	end

	def gane_o_perdi_?
		if @errores == 10
			puts "Perdiste, la palabra era "+@word
			return 'Perdiste, la palabra era '+@word
		end
		if not @aciertos.include? "__"
			puts 'GANASTE!'
			return 'GANASTE!'
		end
	end

end
