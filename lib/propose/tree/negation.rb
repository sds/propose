module Propose::Tree
  # A negated expression.
  class Negation < UnaryOperation
    def initialize(sentence)
      super('¬', sentence)
    end

    def evaluate(assignment)
      !@formula.evaluate(assignment)
    end
  end
end
