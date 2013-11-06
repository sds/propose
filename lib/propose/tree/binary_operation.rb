module Propose::Tree
  # Represents two propositional formula joined by a logical connective.
  class BinaryOperation < Struct.new(:operator, :left, :right)
    def inspect
      "#<#{self.class.name.split('::').last} #{left.inspect} #{right.inspect}>"
    end

    def to_s
      "(#{left.to_s}) #{operator.to_s} (#{right.to_s})"
    end
  end
end
