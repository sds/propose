module Propose::Tree
  class Conjunction < BinaryOperation
    def initialize(left, right)
      super('∧', left, right)
    end
  end
end
