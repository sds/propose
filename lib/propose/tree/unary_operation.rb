module Propose::Tree
  # Represents an operation on a single propositional formula.
  class UnaryOperation < Node
    attr_reader :operator, :formula

    def initialize(operator, formula)
      @operator = operator
      @formula = formula
    end

    def ==(other)
      super || @operator == other.operator && @formula == other.formula
    end

    def children
      [formula]
    end

    def literal?
      @formula.literal?
    end

    def inspect
      "#<#{self.class.name.split('::').last} #{formula.inspect}>"
    end

    def to_s
      output = [operator.to_s]
      output << (formula.literal? ? formula.to_s : "(#{formula})")
      output.join
    end
  end
end
