=begin

Vectorized functions/methods for parsing strings.

Class Methods
	String Methods
		1. detect() = output true if string mtches a pattern; else, false.
		2. prefix() 	= appends a string at the beginning of another string.
		3. suffix()  	= appends a string at the end of another string.
		4. left()    	= equivalent to Excel's LEFT().
		5. right()   	= equivalent to Excel's RIGHT().
		6. mid()		= equivalent to Excel's MID().
		7. extract()    = extract a pattern from a string.
		8. titlecase()  = capitalize each word in a string.
	
	Array Methods
		1. gsubv()			= vectorization of gsub.
		2. chompv()		    = vectorization of chomp.
		3. matchv()      	= vectorization of match.
		4. reversev()    	= vectorization of reverse.
		5. paste()			= concatenates an array element with another array element, optionally divided by a separator.
		6. prefixv() 		= vectorization of prefix.
		7. suffixv()		= vectorization of suffix.
		8. stripv()			= vectorization of strip.
		9. lstripv()      	= vectorization of lstrip.
		10. rstripv()	  	= vectorization of rstrip.
		11. upcasev()		= vectorization of upcase.
		12. downcasev()	    = vectorization of downcase.
		13. swapcasev()	    = vectorization of swapcase.
		14. capitalizev() 	= vectorization of capitalize.
		15. scanv()       	= vectorization of scan.
		16. detectv()     	= vectorization of detect.
		17. length()      	= vectorization of length.
		18. indexv()      	= vectorization of index.
		19. extractv()    	= vectorization of extract.
		20. leftv()       	= vectorization of left.
		21. rightv()      	= vectorization of right.
		22. midv()        	= vectorization of mid.	
		23. switch()      	= recode an array.
		24. grepl()       	= synonym of detectv.
		25. titlecasev()    = vectorization of titlecase.
		
=end


class String

	# detect = output true if string matches a pattern; else, false.
	def detect(pattern)
	
		pattern.match?(self)
		
	end
	
	# prefix = attach a string to the beginning of another string.
	def prefix(string)
	
		string + self
	
	end
	
	# suffix = attach a string to the end of another string.
	def suffix(string)
	
		self + string
	
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
	def mid(start, n)
	
		self[start..start + n]
		
	end
	
	# extract = extract a pattern from a string.
	def extract(pattern)
	
		self[pattern]
	
	end	

	# titlecase = capitalize each word in a string
	def titlecase()

		self.split(" ").map {|x| x.capitalize}.join(" ")

	end
	
end

class Array

	# gsubv()  = vectorization of gsub
	def gsubv(pattern, replace)

	  self.map {|x| x.gsub(pattern, replace)}
	  
	end

	# chompv() = vectorization of chomp
	def chompv()

	  self.map(&:chomp)
	  
	end
	 
	 # matchv() = vectorization of match
	 def match(pattern)
	 
	   self.map {|x| x.match(pattern)}
	   
	end

	# reversev() = vectorization of reverse
	def reversev()

	  self.map(&:reverse)
	  
	end
		
	# paste() = parallel concatenate each array element with another array element
	## inspired by R's paste0() function.
	def paste(y, separator = "") 
	
		self.zip(y).map {|x, y| x + separator + y}
		
	end
	
	# prefixv() = attach a string to the beginning of each array element.
	def prefixv(string)
	
		self.map{|x| string + x}
	
	end
	
	# suffixv() = attach a string to the end of each array element
	def suffixv(string)
	
		self.map{|x| x + string}
	
	end
	
	# stripv() = vectorization of strip
	def stripv()
	
		self.map(&:strip)
		
	end
	
	# lstripv() = vectorization of lstrip
	def lstripv()
	
		self.map(&:lstrip)
		
	end

	# rstripv() = vectorization of rstrip
	def rstripv()
	
		self.map(&:rstrip)
		
	end	
	
	# upcasev() = vectorization of upcase
	def upcasev()
	
		self.map(&:upcase)
		
	end
	
	# downcasev() = vectorization of downcase
	def downcasev()
	
		self.map(&:downcase)
		
	end	
	
	# swapcasev() = vectorization of swapcase
	def swapcasev()
	
		self.map(&:swapcase)
		
	end	
	
	# capitalizev() = vectorization of capitalize
	def capitalizev()
	
		self.map(&:capitalize)
		
	end	
	
	# scanv() = vectorization of scan
	def scanv(pattern)
	
		self.map{|x| x.scan(pattern)}
		
	end
	
	# detectv() = vectorization of detect
	def detectv(pattern)
	
		self.map {|x| x.detect(pattern)}
		
	end
	
	# lengthv() = vectorization of length
	def lengthv()
	
		self.map(&:length)
		
	end
	
	# indexv() = vectorization of index
	def indexv(pattern)
	
		self.map {|x| x.index(pattern)}
		
	end
	
	# extractv() = return the string of a pattern match; else, nil
	def extractv(pattern)
	
		self.map{|x| x[pattern]}
	
	end
	
	# leftv(), rightv(), midv(), are vectorized versions of left, right, and mid.
	def leftv(n) self.map {|x| x.left(n)} end
	def rightv(n) self.map {|x| x.right(n)} end
	def midv(start, n) self.map {|x| x.mid(start, n)} end
	
	# switch() = recode an array.
	def switch(initial, new)
	
		out = self		
		
		range = (0..initial.length - 1).step(1).to_a

		for z in range
		 
		  out = out.map {|y| y.gsub(initial[z], new[z])}
		  
		end
		
		out				
	
	end
	
	# grepl() = synonym of detectv.
	def grepl(pattern)
	
		self.map {|x| x.match?(pattern)}
		
	end

	# titlecasev() = vectorization of titlecase.
	def titlecasev

		self.map {|x| x.titlecase}

	end

end