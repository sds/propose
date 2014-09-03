module Propose::Tree
  class Implication < BinaryOperation
    def initialize(left, right)
      super('→', left, right)
    end

    def evaluate(assignment)
      !left.evaluate(assignment) || right.evaluate(assignment)
    end
  end
end
