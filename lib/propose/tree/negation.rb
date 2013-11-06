module Propose::Tree
  class Negation < UnaryOperation
    def initialize(sentence)
      super('¬', sentence)
    end
  end
end
