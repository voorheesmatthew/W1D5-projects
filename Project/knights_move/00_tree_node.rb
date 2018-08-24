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
    raise "Node is not a child" if child_node.parent == nil
    child_node.parent = nil
  end
  
  def inspect 
    "Node: #{@value}, Parent: #{@parent.value} Children: #{@children.map {|child| child.value}}"
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      check_el = queue.shift
      return check_el if check_el.value == target_value
      queue += check_el.children
    end
    nil
  end
end