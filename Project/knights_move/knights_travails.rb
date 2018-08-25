require 'byebug'
require_relative '00_tree_node.rb'

class KnightPathFinder
 attr_reader :visited, :root_node, :queue
 
  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @visited = [start_pos]
    @queue = []
    build_move_tree
  end 

  def self.valid_moves(pos)
    valids = [] 
    valids << [pos.first + 1, pos.last + 2]
    valids << [pos.first + 2, pos.last + 1]
    valids << [pos.first - 1, pos.last - 2]
    valids << [pos.first - 2, pos.last - 1]
    valids << [pos.first + 1, pos.last - 2]
    valids << [pos.first - 1, pos.last + 2]
    valids << [pos.first + 2, pos.last - 1]
    valids << [pos.first - 2, pos.last + 1]
  
    valids.reject! {|pos| pos[0] > 7 || pos[0] < 0}
    valids.reject! {|pos| pos[1] > 7 || pos[1] < 0}
    valids
  end

  
  def build_move_tree
    # debugger
    q = []
    q << @root_node
    until q.empty? || @visited.length == 64
      # set current_node
      current_node = q.shift
      # p "Class of Node is: #{current_node.class?}"
      pos = current_node.value
      # get new moves based off node_value
      moves = new_move_pos(pos)
      # turn new moves into node_children
      nodes = moves.map do |move|  
    
        el = PolyTreeNode.new(move)
        # add children to current_node
        current_node.add_child(el)
        el
      end
      # add children nodes to @queue
      q += nodes
    end
  end 
  
  def new_move_pos(pos)
    # debugger
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.reject! {|spots| @visited.include?(spots)}
    @visited += new_moves
    new_moves
  end 
  
end 

