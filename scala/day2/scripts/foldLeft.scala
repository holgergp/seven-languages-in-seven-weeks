val stringList=List ("eins","zwei","drei")
val size = (0 /: stringList) {(size,i) => size + i.length}
println (size)
