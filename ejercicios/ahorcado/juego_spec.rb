require 'rspec'
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


	describe 'verificar_letra' do

		it 'should return true when letter is a and word is car ' do
			@juego.set_palabra 'car'
			@juego.verificar_letra('a').should be true
		end

		it 'should return false when letter is e and word is car ' do
			@juego.set_palabra 'car'
			@juego.verificar_letra('e').should be false
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
			@juego.verificar_letra 'a'
			@juego.get_errores().should eq 1
		end	

		it 'deberia devolver 2 cuando pregunto mal 2 veces y la palabra es oso' do
			@juego.set_palabra 'oso'
			@juego.verificar_letra 'a'
			@juego.verificar_letra 'j'
			@juego.get_errores().should eq 2
		end
	end

	describe 'aciertos' do

			it 'deberia devoler un array con los __ vacios al inicio del juego' do
				@juego.set_palabra 'prueba'
				@juego.get_aciertos().should eq []
			end

			it 'deberia devolver un array con la letra que acertamos' do
				@juego.set_palabra 'agua'
				@juego.verificar_letra 'g'
				@juego.get_aciertos().should eq [g]
			end

			it 'deberia devolver un array con las letras que acertamos' do
				@juego.set_palabra 'agua'
				@juego.verificar_letra 'g'
				@juego.verificar_letra 'a'
				@juego.get_aciertos().should eq ["g", 'a', 'a']
			end


	describe 'estado del Juego' do

		it 'deberia devolver la cantidad de vidas que nos quedan si todavia no perdimos ni ganamos' do
			@juego.set_palabra 'oso'
			@juego.status().should eq 'Te quedan 10 intentos.'
			@juego.verificar_letra 'a' 	# Letra erronea
			@juego.status().should eq 'Te quedan 9 intentos.'
			@juego.verificar_letra 's'	# Letra Correcta
			@juego.status().should eq 'Te quedan 9 intentos.'
			@juego.verificar_letra 'c'	# Letra erronea
			@juego.verificar_letra 'd'	# Letra erronea
			@juego.status().should eq 'Te quedan 7 intentos.'

		end

		it 'deberia devolver que ganamos el juego si acertamos'

	end		

end