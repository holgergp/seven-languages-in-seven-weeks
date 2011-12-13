
def a_t_h
puts "Array to Hash"
a1=["test","this",1,"feature"]
puts a1
puts Hash[*a1.flatten]
end

def h_t_a
puts "Hash to Array"
h1={:first=>"test",:second=>"this",:third=>"feature"}
h1.to_a.each{|value|puts value}
end

def iterate
puts "Iterate"
{:first=>"test",:second=>"this",:third=>"feature"}.each {|key,value| puts "Key: #{key} Value: #{value}"}
end

a_t_h
puts "============================================="
h_t_a
puts "============================================="
iterate

