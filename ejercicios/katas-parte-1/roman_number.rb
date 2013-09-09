

class RomanNumber
	
		def initialize(number)
		@num = number
		end

		def value
			return "#{@num}"
		end

		def add(romanNumber)
			result = RomanNumber.new("#{@num}#{romanNumber.value}")
			result.value
		end
end
