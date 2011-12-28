

def treeIterate
tree={'grandpa'=>{'dad'=>{'child1'=>{},'child2'=>{}},'uncle'=>{'child1'=>{}}}}
tree.each {|key,value| puts "Key: #{key} Value: #{value}"}


tree.each{|key,value| }
end

treeIterate


class Tree
attr_accessor :children,:node_name

def initialize(name,children=[])
	@children=children
	@node_name=name
end

def visit_all(&block)
	visit &block
	children.each{|c|c.visit_all &block}
end

def visit(&block)
	block.call self
end


end

ruby_tree = Tree.new("Ruby",[Tree.new("Reia"),Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all{|node| puts node.node_name}


class AdvancedTree

attr_accessor :children,:node_name

def initialize(treeData)
	
@children=[]
puts treeData.size
if (treeData.size==1)

@node_name=treeData.keys()[0]

treeData[@node_name].each do |key,value|
	@children.push(AdvancedTree.new(key=>value))
end


else
	p "Please give a tree structure as an input, I detected multiple parents"
end
	
end

#def each
	#yield node_name
	#@children.each{|child_node| child_node.each{|e| yield e} }
#end


def visit_all(&block)
	visit &block
	children.each{|c|c.visit_all &block}
end

def visit(&block)
	block.call self
end
end

tree={'grandpa'=>{'dad'=>{'child1'=>{},'child2'=>{}},'uncle'=>{'child3'=>{},'child4'=>{}}}}

atree=AdvancedTree.new(tree)

puts "Visiting a node"
atree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
atree.visit_all{|node| puts node.node_name}
