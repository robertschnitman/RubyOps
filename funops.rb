# Higher-order functions/methods.

class Array

	# map2 = map a function to two arrays in parallel.
	def map2(y, proc1)
	
	  if proc1.class == Proc 
	
		self.zip(y).map(&proc1) #if proc1.class == Proc
		
		# x = ["Ruby", "Crystal", "Emerald"]
		# y = ["Baby", "Back", "Ribs"]
		
		# x.map2(y, proc {|x, y| x + y})
		
	  else
	   
	   raise "The proc1 input must be a Proc class object. The class of the object passed was #{proc1.class.to_s}."
	   
	   # x.map2(y, :+)
	   
	  end
	  
	end
	
	# mapreduce = map a function to an array and then reduce it by another function.	
	def mapreduce(fun1, fun2)
	
	  self.map(&fun1).reduce(&fun2)
	  # (1..10).mapreduce(lambda {|x| x + 2}, :+) == (1..10).map {|x| x + 2}.reduce(:+)
	  
	end
	
end
