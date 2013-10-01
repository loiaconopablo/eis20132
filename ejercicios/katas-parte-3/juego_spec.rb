require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative './juego.rb'


describe 'Juego' do

	describe 'modelo del juego' do
		subject { @juego = Juego.new }

		it { should respond_to( :set_palabra) }
		it { should respond_to( :get_errores) }
		it { should respond_to( :verificar_letra) }
		it { should respond_to( :obtener_longitud) }

	end

	before (:each) { @juego = Juego.new }


	describe 'verificar aciertos' do

		it 'deberia decirnos que acertamos la letra A' do
			@juego.set_palabra 'car'
			@juego.verificar_letra('a').equal? "Acertaste la letra a"
		end

		it 'deberia decirnos que acertamos la letra C ' do
			@juego.set_palabra 'car'
			@juego.verificar_letra('C').equal? "Acertaste la letra C"
		end

	end

	describe 'obtener_longitud' do

		it 'deberia devolver 3 cuando la palabra es car' do
			@juego.set_palabra 'car'
			@juego.obtener_longitud().should eq 3
		end	

		it 'deberia devolver 4 cuando la palabra es cars' do
			@juego.set_palabra 'cars'
			@juego.obtener_longitud().should eq 4
		end		

	end	


	describe 'get_errores' do

		it 'deberia devolver 0 cuando recien empiezo' do
			@juego.set_palabra 'car'
			@juego.get_errores().should eq 0
		end	

		it 'deberia devolver 1 cuando pregunto por a y la palabra es oso' do
			@juego.set_palabra 'oso'
			@juego.verificar_letra('a').equal? 'Te quedan 9 intentos.'
			@juego.get_errores().should eq 1
		end	

		it 'deberia devolver 2 cuando pregunto mal 2 veces y la palabra es planta y a su vez acierto letras' do
			@juego.set_palabra 'planta'
			@juego.verificar_letra('p') # Letra Correcta
			@juego.verificar_letra('x')# Letra Incorrecta
			@juego.verificar_letra('a') # Letra Correcta
			@juego.verificar_letra('j').equal? 'Te quedan 8 intentos.' # Letra Incorrecta
			@juego.get_errores().should eq 2
		end
	end

	describe 'aciertos' do

			it 'deberia devoler un array con los __ vacios al inicio del juego' do
				@juego.set_palabra 'prueba'
				@juego.get_aciertos().should eq ["__", "__", "__", "__", "__", "__"]
			end

			it 'deberia devolver un array con la letra que acertamos' do
				@juego.set_palabra 'agua'
				@juego.verificar_letra 'g'
				@juego.get_aciertos().should eq ["__", "g", "__", "__"]
			end

			it 'deberia devolver un array con las letras que acertamos' do
				@juego.set_palabra 'agua'
				@juego.verificar_letra 'g'
				@juego.verificar_letra 'a'
				@juego.get_aciertos().should eq [ "a", "g", "__", "a"]
			end
	end


	describe 'estado del Juego' do

		it 'deberia devolver Ganaste si acertamos la palabra OSO' do
			@juego.set_palabra 'oso'
			@juego.verificar_letra 's'	
			@juego.verificar_letra('o').equal? 'GANASTE!'
		end

		it 'deberia devolver que perdimos al tener 10 errores y la palabra correcta que era' do
			@juego.set_palabra 'oso'
			@juego.verificar_letra 'a'	
			@juego.verificar_letra 'b'
			@juego.verificar_letra 'c'	
			@juego.verificar_letra 'd'
			@juego.verificar_letra 'e'	
			@juego.verificar_letra 'f'
			@juego.verificar_letra 'g'	
			@juego.verificar_letra 'a'
			@juego.verificar_letra 'a'
			@juego.verificar_letra('b').equal? "Perdiste, la palabra era oso"
		end

	end		

end
