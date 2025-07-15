function sourcedir -d "source all fish files in directory"
	for file in $argv[1]/*.fish
		source $file
	end
end
