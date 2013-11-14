module Propose::Tree
  # Represents two propositional formula joined by a logical connective.
  class BinaryOperation < Node
    attr_reader :operator, :left, :right

    def initialize(operator, left, right)
      @operator = operator
      @left = left
      @right = right
    end

    def ==(other)
      super || @operator == other.operator &&
               @left == other.left &&
               @right == other.right
    end

    def children
      [left, right]
    end

    def inspect
      "#<#{self.class.name.split('::').last} #{left.inspect} #{right.inspect}>"
    end

    def to_s
      "(#{left.to_s}) #{operator.to_s} (#{right.to_s})"
    end
  end
end
