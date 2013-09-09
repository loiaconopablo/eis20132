
class NumberGame
	#Tiene que decir el número de la posicion que le toca, pero si el número es multiplo de 3 debe decir Fizz, si es multiplo de 5 "Buzz" y
	#si es multiplo de los dos "FizzBuzz"'

	def initialize(number = 0)
		@value=number
	end

	def position
		evaluacionConTres = @value % 3
		evaluacionConCinco = @value % 5
		ambasEvaluaciones = evaluacionConTres + evaluacionConCinco

		case 
		when (ambasEvaluaciones == 0)
			return "FizzBuzz"
		when (evaluacionConTres == 0)
			return "Fizz"
		when (evaluacionConCinco == 0)
			return "Buzz"
		else
			return @value
		end

	end


	def listar(inicio, fin)
		desde = inicio
		while (desde<fin)
			@value=desde
			puts self.position
			desde = desde+1	
		end
	end

end

a = NumberGame.new()
a.listar(1, 100)
