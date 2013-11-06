module Propose::Tree
  class Implication < BinaryOperation
    def initialize(left, right)
      super('⇒', left, right)
    end
  end
end
