require 'singleton'

module Propose::Tree
  # Represents a contradiction, or falseness.
  class Falsum < Node
    include Singleton

    def evaluate(assignment)
      false
    end

    def literal?
      true
    end

    def inspect
      '#<Falsum>'
    end

    def to_s
      '⊥'
    end
  end
end
