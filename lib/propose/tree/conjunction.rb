module Propose::Tree
  # A conjunction of two expressions, indicating both are true.
  class Conjunction < BinaryOperation
    def initialize(left, right)
      super('∧', left, right)
    end

    def evaluate(assignment)
      left.evaluate(assignment) && right.evaluate(assignment)
    end
  end
end
