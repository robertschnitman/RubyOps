=begin
Author: Robert Schnitman
Date Created: 2020-06-17
Date Modified: 2020-06-18
Decsription: List of functions for
  managing strings, focusing on 
  vectorizing existing methods.
  
  Inspired by the R library stringr.

require "./"

Class Methods
	String Methods
		1. detect() = output true if string mtches a pattern; else, false.
		2. prefix() = appends a string at the beginning of another string.
		3. suffix() = appends a string at the end of another string.
		4. left()   = equivalent to Excel's LEFT().
		5. right()  = equivalent to Excel's RIGHT().
		6. mid()    = equivalent to Excel's MID().
	
	Array Methods
		1. gsubm()        = vectorization of gsub
		2. chompm()       = vectorization of chomp
		3. matchm()       = vectorization of match
		4. revm()         = vectorization of reverse
		5. paste()        = concatenates an array element with another array element, optionally divided by a delimiter.
		6. prefixm()      = vectorization of prefix
		7. suffixm()      = vectorization of suffix
		8. stripm()       = vectorization of strip
		9. lstripm()      = vectorization of lstrip
		10. rstripm()	  = vectorization of rstrip	
		11. upcasem()     = vectorization of upcase
		12. downcasem()   = vectorization of downcase
		13. swapcasem()   = vectorization of swapcase
		14. capitalizem() = vectorization of capitalize
		15. scanm()       = vectorization of scan
		16. detectm()     = vectorization of detect
		17. length()      = vectorization of length
		18. indexm()      = vectorization of index
		19. extract()     = return the string of a pattern match; else, nil

=end


class String

	# detect = output true if string matches a pattern; else, false.
	def detect(pattern)
	
		pattern.match?(self)
		
	end
	
	# prefix = attach a string to the beginning of another string
	def prefix(string)
	
		string + prefix
	
	end
	
	# suffix = attach a string to the end of another string.
	def suffix(string)
	
		string + suffix
	
	end
	
	# left = equivalent to Excel's LEFT().
	def left(n)
	
		self[0..n]
		
	end
	
	# right = equivalent to Excel's RIGHT()
	def right(n)
	
		self[-n..-1]
		
	end
			
	# mid = equivalent to Excel's MID()
	def mid(start, stop)
	
		self[start..start + stop]
		
	end
	
	
end

class Array

	# gsubm()  = vectorization of gsub
	def gsub(pattern, replace)

	  self.map {|x| x.gsub(pattern, replace)}
	  
	end

	# chompm() = vectorization of chomp
	def chompm()

	  self.map(&:chomp)
	  
	end
	 
	 # matchm() = vectorization of match
	 def match(pattern)
	 
	   self.map {|x| x.match(pattern)}
	   
	end

	# revm() = vectorization of reverse
	def revm()

	  self.map(&:reverse)
	  
	end
		
	# paste = parallel concatenate each array element with another array element
	## inspired by R's paste0m() function.
	def paste(y, delimiter = "") 
	
		self.zip(y).map {|x, y| x + delimiter + y}
		
	end
	
	# prefixm = attach a string to the beginning of each array element.
	def prefixm(string)
	
		self.map{|x| string + x}
	
	end
	
	# suffixm = attach a string to the end of each array element
	def suffixm(string)
	
		self.map{|x| x + string}
	
	end
	
	# stripm = vectorization of strip
	def stripm()
	
		self.map(&:strip)
		
	end
	
	# lstripm = vectorization of lstrip
	def lstripm()
	
		self.map(&:lstrip)
		
	end

	# rstripm = vectorization of rstrip
	def rstripm()
	
		self.map(&:rstrip)
		
	end	
	
	# upcasem = vectorization of upcase
	def upcasem()
	
		self.map(&:upcase)
		
	end
	
	# downcasem = vectorization of downcase
	def downcasem()
	
		self.map(&:downcase)
		
	end	
	
	# swapcasem = vectorization of swapcase
	def swapcasem()
	
		self.map(&:swapcase)
		
	end	
	
	# capitalizem = vectorization of capitalize
	def capitalizem()
	
		self.map(&:capitalize)
		
	end	
	
	# scanm = vectorization of scan
	def scanm(pattern)
	
		self.map{|x| x.scan(pattern)}
		
	end
	
	# detectm = vectorization of detect
	def detectm(pattern)
	
		self.map {|x| x.detect(pattern)}
		
	end
	
	# length = vectorization of length
	def lengthm()
	
		self.map(&:length)
		
	end
	
	# indexm = vectorization of index
	def indexm(pattern)
	
		self.map {|x| x.index(pattern)}
		
	end
	
	# extract = return the string of a pattern match; else, nil
	def extract(pattern)
	
		self.map{|x| x[pattern]
		}
	
	end

end
	
