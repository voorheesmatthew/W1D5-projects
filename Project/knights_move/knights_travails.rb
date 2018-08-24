require 'byebug'
require_relative '00_tree_node.rb'

class KnightPathFinder
  
  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @visited = [start_pos]
    # build_move_tree
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
    # self.new_move_pos
  end 
  
  def new_move_pos(pos)
    # debugger
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.reject! {|spots| @visited.include?(spots)}
    @visited << new_moves
    new_moves
  end 
  
end 

