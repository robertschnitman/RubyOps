=begin
Author: Robert Schnitman
Date: 2020-07-15
Description: Compilation of methods for managing files.
=end

require "P:/Robert/Automation/Ruby/Gems/stringops.rb"

def get_files(path)

	Dir[path + "*.*"].gsubv(path, "")
	
end

def get_dirs(path)

	Dir[path + "*/"].gsubv(path, "").gsubv("/", "")
	
end