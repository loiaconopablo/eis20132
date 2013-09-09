

class RomanNumber
	
		def initialize(number)
		@num = number
		end

		def value
			return "#{@num}"
		end

		def num #Getter
			@num
		end


		def add(romanNumber)
			result = RomanNumber.new("#{@num}#{romanNumber.value}")
			#result.value
		end

		def == (other_roman)
			if [ (other_roman.class) == (self.class) ] && [(other_roman.num) == (self.num)]
				true
			else
				false
			end
		end

end
