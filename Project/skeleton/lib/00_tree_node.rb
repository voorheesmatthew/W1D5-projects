class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end
  
  def parent=(parent)
    
    if parent 
      @parent.children.delete(self) unless @parent.nil?
      @parent = parent
      @parent.children << self unless @parent.children.include?(self)
    else
       @parent = nil
    end
    
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    
  end
  
  def inspect 
    "Node: #{@value}, Parent: #{@parent.value} Children: #{@children.map {|child| child.value}}"
  end
  
end