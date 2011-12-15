
# Iterate over an array of 16 numbers using just 'each'
# Print 4 numbers each in one line
def arraySimplePrint(a)
puts "Iterate over an array using 'each'."
# I need somethin that counts the current array index
# Well, thats more than just 'each'. Perhaps there is a better solution for this
i=1
a.each do |value| 
  print value
  # Use mod to create a new line
  if i%4==0
    print "\n" 
  else
    # To make it look prettier
    print ","		
  end
  i+=1
end
end

# Iterate over an array of 16 numbers using just 'each_slice' of enumarable
def arraySlicePrint(a)
puts "Iterate over an array using 'each_slice'."
a.each_slice(4) {|value| puts value.join(',') }

end


a=(1..16).to_a


arraySimplePrint a
puts "-------------------------------------------"
arraySlicePrint a

