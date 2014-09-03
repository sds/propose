module Propose::Tree
  # Expresses the concept that the right expression is a logical consequence of
  # the left expression.
  class Implication < BinaryOperation
    def initialize(left, right)
      super('→', left, right)
    end

    def evaluate(assignment)
      !left.evaluate(assignment) || right.evaluate(assignment)
    end
  end
end
