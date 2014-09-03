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
      output = []
      output << (left.literal? ? left.to_s : "(#{left})")
      output << " #{operator} "
      output << (right.literal? ? right.to_s : "(#{right})")
      output.join
    end
  end
end
