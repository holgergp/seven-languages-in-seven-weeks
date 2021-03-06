#Convert an array to a hash
def a_t_h
puts "Array to Hash"
a1=["test","this",1,"feature"]
puts a1
puts Hash[*a1.flatten]
end

#Convert a hash to an array
def h_t_a
puts "Hash to Array"
h1={:first=>"test",:second=>"this",:third=>"feature"}
h1.to_a.each{|value|puts value}
end

#Iterate over a hash
def iterate
puts "Iterate"
{:first=>"test",:second=>"this",:third=>"feature"}.each {|key,value| puts "Key: #{key} Value: #{value}"}
end

def iterateOverNewHash
  puts "Iterate over new Hash"
  a1=["test","this",1,"feature"]
 
  h2= Hash[*a1.flatten]
  h2.each {|key,value| puts "Key: #{key} Value: #{value}"}
  
end

# Datastructures supported by ruby arrays: queues, stacks, sets, arrays and lists



a_t_h
puts "============================================="
h_t_a
puts "============================================="
iterate
puts "============================================="


