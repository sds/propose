module Propose::Tree
  class Disjunction < BinaryOperation
    def initialize(left, right)
      super('∨', left, right)
    end

    def evaluate(assignment)
      left.evaluate(assignment) || right.evaluate(assignment)
    end
  end
end
