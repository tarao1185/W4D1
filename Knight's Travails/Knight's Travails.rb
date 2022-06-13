require PolyTreeNode.rb

class KnightPathFinder
    attr_reader :starting_pos
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
        self.build_move_tree
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

    def root_node(starting_pos)
        @root_node = PolyTreeNode.new(starting_pos)
    end

    def new_move_positions(pos)
        @considered_positions = [starting_pos]
        new_moves = self.valid_moves(pos) 
        new_moves.each do |move|
            if !@considered_positions.include?(move)
                @considered_positions << move
            end   
        end 
        @considered_positions
    end

    def add_nodes(current_parent)
        @considered_positions.each do |move|
            child_node = PolyTreeNode.new(move)
            child_node.parent=(current_parent)
        end

    end

    def build_move_tree
        root_node = self.root_node(starting_pos)    
        queue = [root_node]
        
        until queue.empty?
            add_nodes(queue.first)
            queue.first.children.each {|child| queue << child}
            queue.shift
        end
        
    end 


end