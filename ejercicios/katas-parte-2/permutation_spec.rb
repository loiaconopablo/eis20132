require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative './permutation.rb'

describe Permutacion do 

	describe 'Permutacion' do

		it 'Cambia de lugar las letras de una cadena de palabras, en este caso ABC' do
			Prueba = Permutacion.new('ABC')
			Prueba.permutar.should eq ['ABC', 'ACB', 'BAC', 'BCA', 'CAB', 'CBA']
		end
	end
	
	describe 'permutando CD' do
		it 'Cambia de lugar las letras de una cadena de palabras, en este caso CD' do
			permutado = Permutacion.new('CD')
			permutado.permutar.should eq ['CD', 'DC']
		end
	end
end


