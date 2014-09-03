module Propose::Tree
  # A disjunction of two expressions, indicating at least one of them is true.
  class Disjunction < BinaryOperation
    def initialize(left, right)
      super('∨', left, right)
    end

    def evaluate(assignment)
      left.evaluate(assignment) || right.evaluate(assignment)
    end
  end
end
