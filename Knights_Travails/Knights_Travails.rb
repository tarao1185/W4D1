require_relative 'PolyTreeNode.rb'

class KnightPathFinder
    attr_reader :starting_pos, :considered_positions, :root_node
    
    MOVES_SET = 
       [[2,1],
        [2, -1],
        [-2, 1],
        [-2, -1],
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2]]

    def initialize(starting_pos)
        @starting_pos = starting_pos
        @root_node = PolyTreeNode.new(starting_pos)
        @considered_positions = [starting_pos]
    end

    def self.valid_moves(pos)
        row, col = pos
        possible_moves = []
        MOVES_SET.each_with_index do |move, i|
            move_row, move_col = move
            if (0..7).include?(row + move_row) && (0..7).include?(col + move_col)
                possible_moves << [row + move_row, col + move_col]
            end
        end
        possible_moves
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
        result = []
        
        new_moves.each do |move|
            if !@considered_positions.include?(move)
                @considered_positions << move
                result << move
            end   
        end 
        
        result
    end


    def build_move_tree
        queue = [@root_node]
        
        until queue.empty?
          current_node = queue.shift
          new_move_positions(current_node.value).each do |move|
                child_node = PolyTreeNode.new(move)
                child_node.parent=(current_node)
          end
            current_node.children.each {|child| queue << child}
        end
    end
    
    def find_path(end_pos)
        queue = [@root_node]
        current_node = queue.shift
        until current_node.value == end_pos
            
        end

    end

end