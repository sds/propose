module Propose::Tree
  class Disjunction < BinaryOperation
    def initialize(left, right)
      super('∨', left, right)
    end
  end
end
