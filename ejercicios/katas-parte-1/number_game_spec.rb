require 'rspec'
require_relative 'number_game.rb'

describe NumberGame do

	describe 'position 2' do

		it 'Simulando que toca la posicion 2' do
			game = NumberGame.new(2)
			game.position.should eq 2
		end
	end

	describe 'position 3' do 
			
		it 'Simulando que toca la posicion 3, tiene que decir "Fizz" en vez del número' do
			game = NumberGame.new(3)
			game.position.should eq "Fizz"
		end
	end

	describe 'position 5' do 

		it 'Simulando la posicion 10, tiene que decir "Buzz" en vez del número' do
			game = NumberGame.new(10)
			game.position.should eq "Buzz"
		end
	end

	describe 'position 15' do
		
		it 'Simulando la posicion 15 que es multiplo de 3 como de 5, tiene que decir "FizzBuzz" en vez del numero' do
			game = NumberGame.new(15)
			game.position.should eq "FizzBuzz"
		end
	end

end



