module Propose::Tree
  class Negation < UnaryOperation
    def initialize(sentence)
      super('¬', sentence)
    end

    def evaluate(assignment)
      !@formula.evaluate(assignment)
    end
  end
end
