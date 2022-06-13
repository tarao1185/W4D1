require_relative 'Knights_Travails.rb'

    class PolyTreeNode
        attr_reader :value, :parent, :children
        def initialize(value)
            @parent = nil
            @children = []
            @value = value
        end
    
        def parent=(node)
            if self.parent != nil 
                self.parent.children.delete(self)
            end
    
            @parent = node
    
            if @parent != nil
                @parent.children << self
            end
        end
    
        def add_child(child)
            child.parent=(self)
        end
    
        def remove_child(child)
            if !self.children.include?(child)
                raise "not a child"
            else
                child.parent=(nil)
            end
        end
    
    
    end