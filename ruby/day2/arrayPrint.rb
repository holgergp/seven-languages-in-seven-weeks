def arraySimplePrint(a)

i=0
a.each do |value| 
  print value
  print "\n" if (i+=1)%4==0
end

end

def arraySlicePrint(a)
a.each_slice(4) {|value| p value }

end


a=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

arraySimplePrint a
arraySlicePrint a

