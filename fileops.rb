# Methods for managing files.

require "stringops.rb"

def get_files(path)

	Dir[path + "*.*"].gsubv(path, "")
	
end

def get_dirs(path)

	Dir[path + "*/"].gsubv(path, "").gsubv("/", "")
	
end