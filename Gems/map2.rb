def map2(x, y, &block) # inspired by purrr::map2()

  x.zip(y).map(&block)
  
end

#a = ["r", "n", "f"]
#b = ["1", "2", "3"]
#map2(a, b){|x, y| x + y} # works

# map2(a, b){&:+} # doesn't work

#my_lambda = ->(x,y) {x + y}
#map2(a, b){my_lambda} # doesn't work
