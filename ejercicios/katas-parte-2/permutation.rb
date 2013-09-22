
class Permutacion

	def initialize(word)
		@value=word
	end

	def permutar
		@value.chars.to_a.permutation.map(&:join).sort
	end

end
