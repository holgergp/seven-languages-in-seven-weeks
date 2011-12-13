def readFileWOBlock
puts "Lese Datei ohne Block ein!"
f=File.open("test.txt")
puts "Lese Datei #{File.basename(f.path)}"
while (line=f.gets)
	puts line
end
f.close
end

def readFileWBlock
puts "Lese Datei mit Block ein"
File.open("test.txt") do |f|
	puts "Lese Datei #{File.basename(f.path)}"
	while (line=f.gets)
		puts line
	end
	end
end

readFileWOBlock
puts "============================================="
readFileWBlock
