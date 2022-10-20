# Math methods

class Array

	def product()
	
		self.reduce(&:*)
		
	end
	
	def div()
	
		self.reduce(&:/)
		
	end
	
	def subtract()
	
		self.reduce(&:-)
		
	end
	
	# "Inverse sum"
	def invsum()
	
		self.subtract
		
	end
	
	def total()
	
		self.sum
		
	end
	
end