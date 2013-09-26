require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative './tenis.rb'

describe TenisGame do |variable|
	
	describe 'Iniciando Juego' do
		it 'Se empieza el juego con dos jugadores con el marcador igualado en 0' do
			juego = TenisGame.new('Pablo','Gabriel')
			juego.darPuntaje.should eq "Love all"
		end
	end

	describe 'Anotando Puntos' do

    before(:each) do
      @juego = TenisGame.new('Pablo','Gabriel')
    end
		
		it 'Punto jugador Uno, 15, 0' do
			@juego.puntoJugadorUno
			@juego.darPuntaje.should eq "Fifteen-Love"
		end

		it 'Punto jugador Dos, 0, 15' do
			@juego.puntoJugadorDos
			@juego.darPuntaje.should eq "Love-Fifteen"
		end

		it 'Puntos igualados en 15' do
			@juego.setPuntajeJ1(1)
			@juego.setPuntajeJ2(1)
			@juego.darPuntaje.should eq "Fifteen all"
		end

		it 'Puntos 30, 15' do
			@juego.setPuntajeJ1(2)
			@juego.setPuntajeJ2(1)
			@juego.darPuntaje.should eq "Thirty-Fifteen"
		end

		it 'Puntos igualados en 30' do
			@juego.setPuntajeJ1(2)
			@juego.setPuntajeJ2(2)
			@juego.darPuntaje.should eq "Thirty all"
		end

		it 'Puntos, 40, 30' do
			@juego.setPuntajeJ1(3)
			@juego.setPuntajeJ2(2)
			@juego.darPuntaje.should eq "Forty-Thirty"
		end

		it 'Puntos igualados en 40' do
			@juego.setPuntajeJ1(3)
			@juego.setPuntajeJ2(3)
			@juego.darPuntaje.should eq "Deuce"
		end

		it 'Ventaja jugador Uno, caso 1' do
			@juego.setPuntajeJ1(4)
			@juego.setPuntajeJ2(3)
			@juego.darPuntaje.should eq "Advantage Pablo"
		end

		it 'Ventaja jugador dos' do
			@juego.setPuntajeJ1(7)
			@juego.setPuntajeJ2(8)
			@juego.darPuntaje.should eq "Advantage Gabriel"
		end

	end
		
	describe 'Ganando jugadores' do

    before(:each) do
      @juego = TenisGame.new('Pablo','Gabriel')
    end

		it 'Gano Jugador 1' do
			@juego.setPuntajeJ1(4)
			@juego.setPuntajeJ2(0)
			@juego.darPuntaje.should eq "Pablo Gano!"
		end

		it 'Gano Jugador 2' do
			@juego.setPuntajeJ1(6)
			@juego.setPuntajeJ2(8)
			@juego.darPuntaje.should eq "Gabriel Gano!"
		end
	end
end